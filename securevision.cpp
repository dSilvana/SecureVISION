#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <chrono>
#include <algorithm>
#include <stdexcept>
#include <cstring>

#include <fcntl.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <linux/fb.h>

#include <opencv2/opencv.hpp>
#include <opencv2/dnn.hpp>
#include <onnxruntime_cxx_api.h>

using namespace std;

// Detection structure
struct Detection
{
    int classId;
    float confidence;
    cv::Rect box;
};

// Check file exists
bool fileExists(const string& path)
{
    ifstream file(path);
    return file.good();
}

// Framebuffer output helper. Writes annotated frames directly to /dev/fb0 so no cv::imshow() is needed
class FramebufferDisplay
{
private:
    int fbFd;
    fb_var_screeninfo vinfo;
    fb_fix_screeninfo finfo;
    uint8_t* fbPtr;
    long screenSize;

public:
    FramebufferDisplay() : fbFd(-1), fbPtr(nullptr), screenSize(0)
    {
        memset(&vinfo, 0, sizeof(vinfo));
        memset(&finfo, 0, sizeof(finfo));
    }

    bool openDevice(const string& fbPath = "/dev/fb0")
    {
        fbFd = open(fbPath.c_str(), O_RDWR);
        if (fbFd < 0)
        {
            cerr << "ERROR: Could not open framebuffer: " << fbPath << endl;
            return false;
        }

        if (ioctl(fbFd, FBIOGET_FSCREENINFO, &finfo))
        {
            cerr << "ERROR: Could not get fixed screen info." << endl;
            close(fbFd);
            fbFd = -1;
            return false;
        }

        if (ioctl(fbFd, FBIOGET_VSCREENINFO, &vinfo))
        {
            cerr << "ERROR: Could not get variable screen info." << endl;
            close(fbFd);
            fbFd = -1;
            return false;
        }

        screenSize = vinfo.yres_virtual * finfo.line_length;

        fbPtr = static_cast<uint8_t*>(mmap(
            0,
            screenSize,
            PROT_READ | PROT_WRITE,
            MAP_SHARED,
            fbFd,
            0));

        if (fbPtr == MAP_FAILED)
        {
            cerr << "ERROR: Could not mmap framebuffer." << endl;
            fbPtr = nullptr;
            close(fbFd);
            fbFd = -1;
            return false;
        }

        cout << "Framebuffer opened: " << vinfo.xres << "x" << vinfo.yres
             << "  bpp=" << vinfo.bits_per_pixel << endl;

        return true;
    }

    void writeFrame(const cv::Mat& inputFrame)
    {
        if (fbFd < 0 || fbPtr == nullptr)
        {
            return;
        }

        cv::Mat frame;
        cv::resize(inputFrame, frame, cv::Size(vinfo.xres, vinfo.yres));

        if (vinfo.bits_per_pixel == 32)
        {
            cv::Mat bgraFrame;
            cv::cvtColor(frame, bgraFrame, cv::COLOR_BGR2BGRA);

            for (int y = 0; y < vinfo.yres; y++)
            {
                uint8_t* dstRow = fbPtr + y * finfo.line_length;
                const uint8_t* srcRow = bgraFrame.ptr<uint8_t>(y);
                memcpy(dstRow, srcRow, vinfo.xres * 4);
            }
        }
        else if (vinfo.bits_per_pixel == 16)
        {
            for (int y = 0; y < vinfo.yres; y++)
            {
                uint16_t* rowPtr = reinterpret_cast<uint16_t*>(fbPtr + y * finfo.line_length);
                const cv::Vec3b* srcRow = frame.ptr<cv::Vec3b>(y);

                for (int x = 0; x < vinfo.xres; x++)
                {
                    uint8_t b = srcRow[x][0];
                    uint8_t g = srcRow[x][1];
                    uint8_t r = srcRow[x][2];

                    uint16_t pixel =
                        ((r >> 3) << 11) |
                        ((g >> 2) << 5)  |
                        ((b >> 3) << 0);

                    rowPtr[x] = pixel;
                }
            }
        }
        else
        {
            cerr << "WARNING: Unsupported framebuffer format: "
                 << vinfo.bits_per_pixel << " bpp" << endl;
        }
    }

    ~FramebufferDisplay()
    {
        if (fbPtr != nullptr && fbPtr != MAP_FAILED)
        {
            munmap(fbPtr, screenSize);
        }

        if (fbFd >= 0)
        {
            close(fbFd);
        }
    }
};

// Letterbox resize like YOLOv5
cv::Mat letterbox(
    const cv::Mat& src,
    int targetWidth,
    int targetHeight,
    float& scale,
    int& padX,
    int& padY)
{
    int srcWidth = src.cols;
    int srcHeight = src.rows;

    scale = min(
        static_cast<float>(targetWidth) / static_cast<float>(srcWidth),
        static_cast<float>(targetHeight) / static_cast<float>(srcHeight));

    int newWidth = static_cast<int>(round(srcWidth * scale));
    int newHeight = static_cast<int>(round(srcHeight * scale));

    cv::Mat resized;
    cv::resize(src, resized, cv::Size(newWidth, newHeight));

    padX = (targetWidth - newWidth) / 2;
    padY = (targetHeight - newHeight) / 2;

    int right = targetWidth - newWidth - padX;
    int bottom = targetHeight - newHeight - padY;

    cv::Mat output;
    cv::copyMakeBorder(
        resized,
        output,
        padY,
        bottom,
        padX,
        right,
        cv::BORDER_CONSTANT,
        cv::Scalar(114, 114, 114));

    return output;
}

// Convert image to CHW float tensor
vector<float> blobFromImageYOLO(const cv::Mat& image)
{
    cv::Mat rgbImage;
    cv::cvtColor(image, rgbImage, cv::COLOR_BGR2RGB);

    cv::Mat floatImage;
    rgbImage.convertTo(floatImage, CV_32F, 1.0 / 255.0);

    vector<cv::Mat> channels(3);
    cv::split(floatImage, channels);

    vector<float> blob;
    blob.reserve(image.rows * image.cols * 3);

    for (int c = 0; c < 3; c++)
    {
        const float* beginPtr = channels[c].ptr<float>(0);
        const float* endPtr = beginPtr + (channels[c].rows * channels[c].cols);
        blob.insert(blob.end(), beginPtr, endPtr);
    }

    return blob;
}

// Parse YOLOv5 output. Expects shape [1, 25200, 10]
vector<Detection> postprocessYOLO(
    const cv::Mat& originalFrame,
    const float* outputData,
    const vector<int64_t>& outputShape,
    float scale,
    int padX,
    int padY,
    const vector<string>& classNames,
    float confThreshold,
    float nmsThreshold)
{
    vector<Detection> detections;

    if (outputShape.size() != 3)
    {
        throw runtime_error("Unexpected output tensor rank. Expected rank 3.");
    }

    if (outputShape[1] != 25200 || outputShape[2] != 10)
    {
        throw runtime_error("Unexpected output tensor shape. Expected [1,25200,10].");
    }

    int numPredictions = static_cast<int>(outputShape[1]);
    int attributes = static_cast<int>(outputShape[2]);
    int numClasses = attributes - 5;

    vector<cv::Rect> boxes;
    vector<float> scores;
    vector<int> classIds;

    for (int i = 0; i < numPredictions; i++)
    {
        const float* row = outputData + i * attributes;

        float xCenter = row[0];
        float yCenter = row[1];
        float width = row[2];
        float height = row[3];
        float objectness = row[4];

        if (objectness < confThreshold)
        {
            continue;
        }

        float bestClassScore = 0.0f;
        int bestClassId = -1;

        for (int c = 0; c < numClasses; c++)
        {
            float classScore = row[5 + c];
            if (classScore > bestClassScore)
            {
                bestClassScore = classScore;
                bestClassId = c;
            }
        }

        float confidence = objectness * bestClassScore;

        if (confidence < confThreshold)
        {
            continue;
        }

        float left = xCenter - width / 2.0f;
        float top = yCenter - height / 2.0f;
        float right = xCenter + width / 2.0f;
        float bottom = yCenter + height / 2.0f;

        // Undo letterbox
        left = (left - static_cast<float>(padX)) / scale;
        top = (top - static_cast<float>(padY)) / scale;
        right = (right - static_cast<float>(padX)) / scale;
        bottom = (bottom - static_cast<float>(padY)) / scale;

        int x = max(0, static_cast<int>(round(left)));
        int y = max(0, static_cast<int>(round(top)));
        int w = min(originalFrame.cols - x, static_cast<int>(round(right - left)));
        int h = min(originalFrame.rows - y, static_cast<int>(round(bottom - top)));

        if (w <= 0 || h <= 0)
        {
            continue;
        }

        boxes.push_back(cv::Rect(x, y, w, h));
        scores.push_back(confidence);
        classIds.push_back(bestClassId);
    }

    vector<int> indices;
    cv::dnn::NMSBoxes(boxes, scores, confThreshold, nmsThreshold, indices);

    for (size_t i = 0; i < indices.size(); i++)
    {
        int idx = indices[i];
        Detection det;
        det.classId = classIds[idx];
        det.confidence = scores[idx];
        det.box = boxes[idx];
        detections.push_back(det);
    }

    return detections;
}

// Draw detections
void drawDetections(
    cv::Mat& frame,
    const vector<Detection>& detections,
    const vector<string>& classNames)
{
    for (size_t i = 0; i < detections.size(); i++)
    {
        const Detection& det = detections[i];

        cv::rectangle(frame, det.box, cv::Scalar(0, 255, 0), 2);

        string label;
        if (det.classId >= 0 && det.classId < static_cast<int>(classNames.size()))
        {
            label = classNames[det.classId] + " " + to_string(det.confidence).substr(0, 4);
        }
        else
        {
            label = "unknown " + to_string(det.confidence).substr(0, 4);
        }

        int baseline = 0;
        cv::Size textSize = cv::getTextSize(
            label,
            cv::FONT_HERSHEY_SIMPLEX,
            0.5,
            1,
            &baseline);

        int textX = det.box.x;
        int textY = max(20, det.box.y - 5);

        cv::rectangle(
            frame,
            cv::Point(textX, textY - textSize.height - 6),
            cv::Point(textX + textSize.width + 4, textY),
            cv::Scalar(0, 255, 0),
            cv::FILLED);

        cv::putText(
            frame,
            label,
            cv::Point(textX + 2, textY - 4),
            cv::FONT_HERSHEY_SIMPLEX,
            0.5,
            cv::Scalar(0, 0, 0),
            1);
    }
}

int main()
{

    const string modelPath = "/home/root/securevision/best.onnx";
    const string videoDevice = "/dev/video1";
    const string framebufferDevice = "/dev/fb0";

    const vector<string> classNames =
    {
        "person",
        "cup",
        "ball",
        "pen",
        "pencil"
    };

    const float confThreshold = 0.25f;
    const float nmsThreshold = 0.45f;

    cout << "Starting SecureVISION object detection application..." << endl;

    if (!fileExists(modelPath))
    {
        cerr << "ERROR: Model file not found: " << modelPath << endl;
        return 1;
    }

    try
    {
        // Open framebuffer
        FramebufferDisplay display;
        if (!display.openDevice(framebufferDevice))
        {
            cerr << "ERROR: Framebuffer setup failed." << endl;
            return 1;
        }

        // Open camera
        cv::VideoCapture cap(videoDevice, cv::CAP_V4L2);
        if (!cap.isOpened())
        {
            cerr << "ERROR: Could not open video device: " << videoDevice << endl;
            return 1;
        }

        cap.set(cv::CAP_PROP_FRAME_WIDTH, 640);
        cap.set(cv::CAP_PROP_FRAME_HEIGHT, 480);
        cap.set(cv::CAP_PROP_FPS, 30);
        cap.set(cv::CAP_PROP_FOURCC, cv::VideoWriter::fourcc('M', 'J', 'P', 'G'));
        cap.set(cv::CAP_PROP_BUFFERSIZE, 1);

        cout << "Camera opened successfully." << endl;

        // ONNX Runtime setup
        Ort::Env env(ORT_LOGGING_LEVEL_WARNING, "SecureVISION");
        Ort::SessionOptions sessionOptions;
        sessionOptions.SetIntraOpNumThreads(1);
        sessionOptions.SetGraphOptimizationLevel(GraphOptimizationLevel::ORT_ENABLE_BASIC);

        cout << "Loading ONNX model..." << endl;
        Ort::Session session(env, modelPath.c_str(), sessionOptions);
        cout << "Model loaded successfully." << endl;

        Ort::AllocatorWithDefaultOptions allocator;

        Ort::AllocatedStringPtr inputNameAllocated = session.GetInputNameAllocated(0, allocator);
        Ort::AllocatedStringPtr outputNameAllocated = session.GetOutputNameAllocated(0, allocator);

        string inputNameStr = inputNameAllocated.get();
        string outputNameStr = outputNameAllocated.get();

        const char* inputNames[] = {inputNameStr.c_str()};
        const char* outputNames[] = {outputNameStr.c_str()};

        vector<int64_t> inputShape =
            session.GetInputTypeInfo(0).GetTensorTypeAndShapeInfo().GetShape();

        if (inputShape.size() != 4)
        {
            cerr << "ERROR: Unexpected input tensor shape." << endl;
            return 1;
        }

        int inputHeight = static_cast<int>(inputShape[2]);
        int inputWidth = static_cast<int>(inputShape[3]);

        cout << "Input name: " << inputNameStr << endl;
        cout << "Output name: " << outputNameStr << endl;
        cout << "Input size: " << inputWidth << "x" << inputHeight << endl;

        cv::Mat frame;
        int frameCount = 0;
        auto startTime = chrono::steady_clock::now();

        while (true)
        {
            if (!cap.read(frame))
            {
                cerr << "ERROR: Failed to read frame from camera." << endl;
                break;
            }

            if (frame.empty())
            {
                cerr << "ERROR: Empty frame received." << endl;
                break;
            }

            float scale = 1.0f;
            int padX = 0;
            int padY = 0;

            cv::Mat inputImage = letterbox(frame, inputWidth, inputHeight, scale, padX, padY);
            vector<float> inputTensorValues = blobFromImageYOLO(inputImage);

            vector<int64_t> tensorShape = {1, 3, inputHeight, inputWidth};

            Ort::MemoryInfo memoryInfo = Ort::MemoryInfo::CreateCpu(
                OrtArenaAllocator,
                OrtMemTypeDefault);

            Ort::Value inputTensor = Ort::Value::CreateTensor<float>(
                memoryInfo,
                inputTensorValues.data(),
                inputTensorValues.size(),
                tensorShape.data(),
                tensorShape.size());

            auto outputTensors = session.Run(
                Ort::RunOptions{nullptr},
                inputNames,
                &inputTensor,
                1,
                outputNames,
                1);

            vector<int64_t> outputShape =
                outputTensors[0].GetTensorTypeAndShapeInfo().GetShape();

            const float* outputData = outputTensors[0].GetTensorData<float>();

            vector<Detection> detections = postprocessYOLO(
                frame,
                outputData,
                outputShape,
                scale,
                padX,
                padY,
                classNames,
                confThreshold,
                nmsThreshold);

            bool personDetected = false;
            for (size_t i = 0; i < detections.size(); i++)
            {
                if (detections[i].classId == 0)
                {
                    personDetected = true;
                    break;
                }
            }

            // if (personDetected)
            // {
            // }

            drawDetections(frame, detections, classNames);

            frameCount++;
            auto currentTime = chrono::steady_clock::now();
            double elapsed = chrono::duration_cast<chrono::milliseconds>(
                currentTime - startTime).count() / 1000.0;

            double fps = 0.0;
            if (elapsed > 0.0)
            {
                fps = static_cast<double>(frameCount) / elapsed;
            }

            string fpsText = "FPS: " + to_string(fps).substr(0, 4);
            cv::putText(
                frame,
                fpsText,
                cv::Point(20, 30),
                cv::FONT_HERSHEY_SIMPLEX,
                0.8,
                cv::Scalar(0, 255, 255),
                2);

            display.writeFrame(frame);
        }

        cap.release();
    }
    catch (const Ort::Exception& e)
    {
        cerr << "ERROR: ONNX Runtime exception: " << e.what() << endl;
        return 1;
    }
    catch (const cv::Exception& e)
    {
        cerr << "ERROR: OpenCV exception: " << e.what() << endl;
        return 1;
    }
    catch (const exception& e)
    {
        cerr << "ERROR: Standard exception: " << e.what() << endl;
        return 1;
    }
    catch (...)
    {
        cerr << "ERROR: Unknown exception occurred." << endl;
        return 1;
    }

    return 0;
}
