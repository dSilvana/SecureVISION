#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <chrono>
#include <algorithm>
#include <stdexcept>
#include <cstring>
#include <csignal>
#include <sstream>
#include <iomanip>
#include <cstdint>
#include <cstdio>
#include <memory>
#include <cerrno>

#include <fcntl.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <sys/stat.h>

#include <gst/gst.h>
#include <gst/app/gstappsrc.h>

#include <opencv2/opencv.hpp>
#include <opencv2/dnn.hpp>
#include <onnxruntime_cxx_api.h>

using namespace std;

volatile sig_atomic_t gStopRequested = 0;

// Stops the program cleanly if Ctrl+C or terminate is used
void handleSignal(int)
{
    gStopRequested = 1;
}

// Formats float values so they print nicely on labels
string formatFloat(float value, int precision = 2)
{
    ostringstream ss;
    ss << fixed << setprecision(precision) << value;
    return ss.str();
}

// Stores one detection result
struct Detection
{
    int classId;
    float confidence;
    cv::Rect box;
};

bool fileExists(const string& path)
{
    ifstream file(path);
    return file.good();
}

// Handles writing frames to HDMI using GStreamer appsrc -> kmssink
class GStreamerDisplay
{
private:
    GstElement* pipeline;
    GstElement* appsrcElement;
    int frameWidth;
    int frameHeight;
    int frameRate;
    guint64 frameCount;
    bool initialized;

public:
    GStreamerDisplay()
        : pipeline(nullptr),
          appsrcElement(nullptr),
          frameWidth(0),
          frameHeight(0),
          frameRate(30),
          frameCount(0),
          initialized(false)
    {
    }

    bool openDevice(int width, int height, int fps = 30)
    {
        frameWidth = width;
        frameHeight = height;
        frameRate = fps;
        frameCount = 0;

        int argc = 0;
        char** argv = nullptr;
        gst_init(&argc, &argv);

        pipeline = gst_pipeline_new("securevision-kms-pipeline");
        if (pipeline == nullptr)
        {
            cerr << "ERROR: Could not create GStreamer pipeline." << endl;
            return false;
        }

        appsrcElement = gst_element_factory_make("appsrc", "securevision-appsrc");
        GstElement* videoconvert = gst_element_factory_make("videoconvert", "securevision-videoconvert");
        GstElement* kmssink = gst_element_factory_make("kmssink", "securevision-kmssink");

        if (appsrcElement == nullptr || videoconvert == nullptr || kmssink == nullptr)
        {
            cerr << "ERROR: Could not create one or more GStreamer elements." << endl;
            if (pipeline != nullptr)
            {
                gst_object_unref(pipeline);
                pipeline = nullptr;
            }
            appsrcElement = nullptr;
            return false;
        }

        GstCaps* caps = gst_caps_new_simple(
            "video/x-raw",
            "format", G_TYPE_STRING, "BGR",
            "width", G_TYPE_INT, frameWidth,
            "height", G_TYPE_INT, frameHeight,
            "framerate", GST_TYPE_FRACTION, frameRate, 1,
            nullptr);

        g_object_set(
            G_OBJECT(appsrcElement),
            "caps", caps,
            "is-live", TRUE,
            "block", FALSE,
            "format", GST_FORMAT_TIME,
            "do-timestamp", TRUE,
            nullptr);

        g_object_set(
            G_OBJECT(kmssink),
            "sync", FALSE,
            nullptr);

        gst_caps_unref(caps);

        gst_bin_add_many(
            GST_BIN(pipeline),
            appsrcElement,
            videoconvert,
            kmssink,
            nullptr);

        if (!gst_element_link_many(appsrcElement, videoconvert, kmssink, nullptr))
        {
            cerr << "ERROR: Could not link GStreamer pipeline elements." << endl;
            gst_object_unref(pipeline);
            pipeline = nullptr;
            appsrcElement = nullptr;
            return false;
        }

        GstStateChangeReturn ret = gst_element_set_state(pipeline, GST_STATE_PLAYING);
        if (ret == GST_STATE_CHANGE_FAILURE)
        {
            cerr << "ERROR: Could not set GStreamer pipeline to PLAYING state." << endl;
            gst_object_unref(pipeline);
            pipeline = nullptr;
            appsrcElement = nullptr;
            return false;
        }

        cout << "GStreamer KMS display opened: "
             << frameWidth << "x" << frameHeight
             << " @ " << frameRate << " FPS" << endl;

        initialized = true;
        return true;
    }

    void writeFrame(const cv::Mat& inputFrame)
    {
        if (!initialized || pipeline == nullptr || appsrcElement == nullptr || inputFrame.empty())
        {
            return;
        }

        cv::Mat outputFrame;

        if (inputFrame.cols != frameWidth || inputFrame.rows != frameHeight)
        {
            cv::resize(inputFrame, outputFrame, cv::Size(frameWidth, frameHeight));
        }
        else
        {
            outputFrame = inputFrame;
        }

        if (!outputFrame.isContinuous())
        {
            outputFrame = outputFrame.clone();
        }

        const size_t bufferSize = static_cast<size_t>(frameWidth * frameHeight * 3);

        GstBuffer* buffer = gst_buffer_new_allocate(nullptr, bufferSize, nullptr);
        if (buffer == nullptr)
        {
            cerr << "WARNING: Could not allocate GStreamer buffer." << endl;
            return;
        }

        GstMapInfo mapInfo;
        if (!gst_buffer_map(buffer, &mapInfo, GST_MAP_WRITE))
        {
            cerr << "WARNING: Could not map GStreamer buffer." << endl;
            gst_buffer_unref(buffer);
            return;
        }

        memcpy(mapInfo.data, outputFrame.data, bufferSize);
        gst_buffer_unmap(buffer, &mapInfo);

        GST_BUFFER_PTS(buffer) = gst_util_uint64_scale(frameCount, GST_SECOND, frameRate);
        GST_BUFFER_DURATION(buffer) = gst_util_uint64_scale(1, GST_SECOND, frameRate);
        frameCount++;

        GstFlowReturn flowRet = gst_app_src_push_buffer(GST_APP_SRC(appsrcElement), buffer);
        if (flowRet != GST_FLOW_OK)
        {
            cerr << "WARNING: Failed to push frame to GStreamer pipeline. Flow code: "
                 << flowRet << endl;
        }
    }

    ~GStreamerDisplay()
    {
        if (pipeline != nullptr)
        {
            gst_element_send_event(pipeline, gst_event_new_eos());
            gst_element_set_state(pipeline, GST_STATE_NULL);
            gst_object_unref(pipeline);
            pipeline = nullptr;
        }

        appsrcElement = nullptr;
        initialized = false;
    }
};

// Handles communication with the Root of Trust through AXI GPIO
// axi_gpio_0 base address = 0x41200000
// Channel 1 = software output to hardware (prsn_flag on bit 0)
// Channel 2 = hardware status to software (rot_status[4:0])
class RoT
{
private:
    static constexpr off_t GPIO_BASE_ADDR = 0x41200000;
    static constexpr size_t GPIO_MAP_SIZE = 0x1000;

    static constexpr off_t CH1_DATA_OFFSET = 0x0;
    static constexpr off_t CH1_TRI_OFFSET  = 0x4;
    static constexpr off_t CH2_DATA_OFFSET = 0x8;
    static constexpr off_t CH2_TRI_OFFSET  = 0xC;

    static constexpr uint32_t PERSON_FLAG_MASK = 0x00000001;

    // rot_status bit meanings
    static constexpr uint32_t ROT_IDLE_MASK  = 0x00000001;
    static constexpr uint32_t ROT_BUSY_MASK  = 0x00000002;
    static constexpr uint32_t ROT_PASS_MASK  = 0x00000004;
    static constexpr uint32_t ROT_FAIL_MASK  = 0x00000008;
    static constexpr uint32_t ROT_ALARM_MASK = 0x00000010;

    int memFd;
    volatile uint32_t* gpioRegs;

public:
    RoT() : memFd(-1), gpioRegs(nullptr) {}

    bool openDevice()
    {
        memFd = open("/dev/mem", O_RDWR | O_SYNC);
        if (memFd < 0)
        {
            cerr << "ERROR: Could not open /dev/mem for AXI GPIO access." << endl;
            return false;
        }

        gpioRegs = static_cast<volatile uint32_t*>(mmap(
            nullptr,
            GPIO_MAP_SIZE,
            PROT_READ | PROT_WRITE,
            MAP_SHARED,
            memFd,
            GPIO_BASE_ADDR));

        if (gpioRegs == MAP_FAILED)
        {
            cerr << "ERROR: Could not map AXI GPIO base address 0x41200000." << endl;
            gpioRegs = nullptr;
            close(memFd);
            memFd = -1;
            return false;
        }

        // Channel 1 as output for prsn_flag
        gpioRegs[CH1_TRI_OFFSET / 4] = 0x00000000;

        // Channel 2 as input for rot_status
        gpioRegs[CH2_TRI_OFFSET / 4] = 0xFFFFFFFF;

        clearPersonFlag();

        cout << "RoT AXI GPIO interface initialized." << endl;
        return true;
    }

    uint32_t readStatus()
    {
        if (gpioRegs == nullptr)
        {
            return 0;
        }

        return (gpioRegs[CH2_DATA_OFFSET / 4] & 0x0000001F);
    }

    bool isAuthenticated()
    {
        return (readStatus() & ROT_PASS_MASK) != 0;
    }

    bool isFailed()
    {
        return (readStatus() & ROT_FAIL_MASK) != 0;
    }

    bool isAlarm()
    {
        return (readStatus() & ROT_ALARM_MASK) != 0;
    }

    bool isBusy()
    {
        return (readStatus() & ROT_BUSY_MASK) != 0;
    }

    void printStatus()
    {
        uint32_t status = readStatus();

        cout << "RoT status = 0x" << hex << status << dec
             << " [idle="  << ((status & ROT_IDLE_MASK)  ? 1 : 0)
             << ", busy="  << ((status & ROT_BUSY_MASK)  ? 1 : 0)
             << ", pass="  << ((status & ROT_PASS_MASK)  ? 1 : 0)
             << ", fail="  << ((status & ROT_FAIL_MASK)  ? 1 : 0)
             << ", alarm=" << ((status & ROT_ALARM_MASK) ? 1 : 0)
             << "]" << endl;
    }

    void setPersonFlag()
    {
        if (gpioRegs == nullptr)
        {
            return;
        }

        uint32_t value = gpioRegs[CH1_DATA_OFFSET / 4];
        value |= PERSON_FLAG_MASK;
        gpioRegs[CH1_DATA_OFFSET / 4] = value;
    }

    void clearPersonFlag()
    {
        if (gpioRegs == nullptr)
        {
            return;
        }

        uint32_t value = gpioRegs[CH1_DATA_OFFSET / 4];
        value &= ~PERSON_FLAG_MASK;
        gpioRegs[CH1_DATA_OFFSET / 4] = value;
    }

    ~RoT()
    {
        if (gpioRegs != nullptr && gpioRegs != MAP_FAILED)
        {
            munmap(reinterpret_cast<void*>(const_cast<uint32_t*>(gpioRegs)), GPIO_MAP_SIZE);
        }

        if (memFd >= 0)
        {
            close(memFd);
        }
    }
};

// Resizes the image while keeping aspect ratio the same
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

// Converts the image into the format needed for YOLO input
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

// Converts raw model output into final detection boxes
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

    if (outputShape[0] != 1 || outputShape[2] < 6)
    {
        throw runtime_error("Unexpected output tensor shape.");
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

// Draws the boxes and labels on the frame
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
            label = classNames[det.classId] + " " + formatFloat(det.confidence, 2);
        }
        else
        {
            label = "unknown " + formatFloat(det.confidence, 2);
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

bool ensureDirectoryExists(const string& path)
{
    struct stat st;
    if (stat(path.c_str(), &st) == 0)
    {
        return S_ISDIR(st.st_mode);
    }

    if (mkdir(path.c_str(), 0777) == 0)
    {
        return true;
    }

    return errno == EEXIST;
}

void writeDetectionsForFrame(
    const string& outputDir,
    int frameIndex,
    const vector<Detection>& detections,
    const vector<string>& classNames)
{
    ostringstream fileName;
    fileName << outputDir << "/frame_" << setw(6) << setfill('0') << frameIndex << ".txt";

    ofstream outFile(fileName.str());
    if (!outFile)
    {
        cerr << "ERROR: Could not create output text file for frame " << frameIndex << endl;
        return;
    }

    for (size_t i = 0; i < detections.size(); i++)
    {
        const Detection& det = detections[i];

        string classLabel = "unknown";
        if (det.classId >= 0 && det.classId < static_cast<int>(classNames.size()))
        {
            classLabel = classNames[det.classId];
        }

        float xCenter = static_cast<float>(det.box.x) + (static_cast<float>(det.box.width) / 2.0f);
        float yCenter = static_cast<float>(det.box.y) + (static_cast<float>(det.box.height) / 2.0f);
        float boxWidth = static_cast<float>(det.box.width);
        float boxHeight = static_cast<float>(det.box.height);

        outFile << classLabel << ", "
                << formatFloat(xCenter, 2) << ", "
                << formatFloat(yCenter, 2) << ", "
                << formatFloat(boxWidth, 2) << ", "
                << formatFloat(boxHeight, 2) << '\n';
    }
}

void deleteTemporaryModelFile(const string& path)
{
    if (fileExists(path))
    {
        remove(path.c_str());
    }
}

// Rebuilds the ONNX model file from the decrypted bytes stored in DDR
bool reconstructModelFromDDR(off_t modelDdrBaseAddr, const string& outputPath)
{
    static constexpr size_t MODEL_SIZE_BYTES = 7172661;
    static constexpr size_t MODEL_MAP_SIZE = 0x00800000;

    int memFd = open("/dev/mem", O_RDONLY | O_SYNC);
    if (memFd < 0)
    {
        cerr << "ERROR: Could not open /dev/mem for model reconstruction." << endl;
        return false;
    }

    void* mappedPtr = mmap(
        nullptr,
        MODEL_MAP_SIZE,
        PROT_READ,
        MAP_SHARED,
        memFd,
        modelDdrBaseAddr);

    if (mappedPtr == MAP_FAILED)
    {
        cerr << "ERROR: Could not map DDR region at base address 0x"
             << hex << modelDdrBaseAddr << dec << "." << endl;
        close(memFd);
        return false;
    }

    const uint8_t* modelBytes = static_cast<const uint8_t*>(mappedPtr);

    ofstream outFile(outputPath, ios::binary);
    if (!outFile)
    {
        cerr << "ERROR: Could not create reconstructed model file: " << outputPath << endl;
        munmap(mappedPtr, MODEL_MAP_SIZE);
        close(memFd);
        return false;
    }

    outFile.write(reinterpret_cast<const char*>(modelBytes), MODEL_SIZE_BYTES);
    outFile.close();

    if (!outFile)
    {
        cerr << "ERROR: Failed while writing reconstructed ONNX file." << endl;
        munmap(mappedPtr, MODEL_MAP_SIZE);
        close(memFd);
        return false;
    }

    munmap(mappedPtr, MODEL_MAP_SIZE);
    close(memFd);

    cout << "Reconstructed ONNX model written to: " << outputPath << endl;
    cout << "Reconstructed model size: " << MODEL_SIZE_BYTES << " bytes" << endl;

    return true;
}

int main()
{
    const string modelPath = "/tmp/model.onnx";
    const string videoDevice = "/dev/video1";
    const string outputTextDirectory = "/tmp/securevision_frame_output";

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

    signal(SIGINT, handleSignal);
    signal(SIGTERM, handleSignal);

    try
    {
        RoT rot;
        if (!rot.openDevice())
        {
            cerr << "ERROR: Could not initialize RoT interface." << endl;
            return 1;
        }

        cout << "Waiting for Root of Trust authentication..." << endl;
        int waitCount = 0;

        while (!gStopRequested)
        {
            if (rot.isAuthenticated())
            {
                cout << "RoT authentication passed." << endl;
                rot.printStatus();
                break;
            }

            if (rot.isFailed())
            {
                cerr << "ERROR: RoT authentication failed. Application will not run." << endl;
                rot.printStatus();
                return 1;
            }

            if (rot.isAlarm())
            {
                cerr << "ERROR: RoT alarm asserted. Application will not run." << endl;
                rot.printStatus();
                return 1;
            }

            if ((waitCount % 10) == 0)
            {
                rot.printStatus();
            }

            waitCount++;
            usleep(100000);
        }

        if (gStopRequested)
        {
            rot.clearPersonFlag();
            return 0;
        }

        // The decrypted model is stored in DDR so HP1 is checked first
        const vector<off_t> candidateModelAddresses =
        {
            0x10000000,
            0x00000000
        };

        usleep(50000);

        Ort::Env env(ORT_LOGGING_LEVEL_WARNING, "SecureVISION");
        Ort::SessionOptions sessionOptions;
        sessionOptions.SetIntraOpNumThreads(1);
        sessionOptions.SetGraphOptimizationLevel(GraphOptimizationLevel::ORT_ENABLE_ALL);

        unique_ptr<Ort::Session> session;
        off_t usedModelAddress = 0;
        bool modelLoaded = false;

        for (size_t i = 0; i < candidateModelAddresses.size(); i++)
        {
            off_t currentAddress = candidateModelAddresses[i];

            cout << "Trying model DDR base address: 0x"
                 << hex << currentAddress << dec << endl;

            deleteTemporaryModelFile(modelPath);

            if (!reconstructModelFromDDR(currentAddress, modelPath))
            {
                continue;
            }

            try
            {
                cout << "Loading ONNX model..." << endl;
                session = make_unique<Ort::Session>(env, modelPath.c_str(), sessionOptions);
                cout << "Model loaded successfully." << endl;
                usedModelAddress = currentAddress;
                modelLoaded = true;
                break;
            }
            catch (const Ort::Exception&)
            {
                cerr << "WARNING: Model load failed from DDR base 0x"
                     << hex << currentAddress << dec
                     << ". Trying next address." << endl;

                deleteTemporaryModelFile(modelPath);
            }
        }

        if (!modelLoaded)
        {
            cerr << "ERROR: Failed to reconstruct and load model from the available DDR window addresses." << endl;
            rot.clearPersonFlag();
            deleteTemporaryModelFile(modelPath);
            return 1;
        }

        cout << "Using model DDR base address: 0x"
             << hex << usedModelAddress << dec << endl;

        cv::VideoCapture cap(videoDevice, cv::CAP_V4L2);
        if (!cap.isOpened())
        {
            cerr << "ERROR: Could not open video device: " << videoDevice << endl;
            deleteTemporaryModelFile(modelPath);
            return 1;
        }

        cap.set(cv::CAP_PROP_FRAME_WIDTH, 640);
        cap.set(cv::CAP_PROP_FRAME_HEIGHT, 480);
        cap.set(cv::CAP_PROP_FPS, 30);
        cap.set(cv::CAP_PROP_FOURCC, cv::VideoWriter::fourcc('M', 'J', 'P', 'G'));
        cap.set(cv::CAP_PROP_BUFFERSIZE, 1);

        cout << "Camera opened successfully." << endl;

        GStreamerDisplay display;
        if (!display.openDevice(640, 480, 30))
        {
            cerr << "ERROR: GStreamer KMS display setup failed." << endl;
            deleteTemporaryModelFile(modelPath);
            return 1;
        }

        if (!ensureDirectoryExists(outputTextDirectory))
        {
            cerr << "ERROR: Could not create output text file directory: " << outputTextDirectory << endl;
            deleteTemporaryModelFile(modelPath);
            return 1;
        }

        Ort::AllocatorWithDefaultOptions allocator;

        Ort::AllocatedStringPtr inputNameAllocated = session->GetInputNameAllocated(0, allocator);
        Ort::AllocatedStringPtr outputNameAllocated = session->GetOutputNameAllocated(0, allocator);

        string inputNameStr = inputNameAllocated.get();
        string outputNameStr = outputNameAllocated.get();

        const char* inputNames[] = {inputNameStr.c_str()};
        const char* outputNames[] = {outputNameStr.c_str()};

        vector<int64_t> inputShape =
            session->GetInputTypeInfo(0).GetTensorTypeAndShapeInfo().GetShape();

        if (inputShape.size() != 4 || inputShape[2] <= 0 || inputShape[3] <= 0)
        {
            cerr << "ERROR: Unexpected or dynamic input tensor shape." << endl;
            deleteTemporaryModelFile(modelPath);
            return 1;
        }

        int inputHeight = static_cast<int>(inputShape[2]);
        int inputWidth = static_cast<int>(inputShape[3]);

        cout << "Input name: " << inputNameStr << endl;
        cout << "Output name: " << outputNameStr << endl;
        cout << "Input size: " << inputWidth << "x" << inputHeight << endl;

        cv::Mat frame;
        vector<Detection> lastDetections;
        int frameIndex = 0;
        const int inferenceInterval = 3;

        vector<int64_t> tensorShape = {1, 3, inputHeight, inputWidth};
        Ort::MemoryInfo memoryInfo = Ort::MemoryInfo::CreateCpu(
            OrtArenaAllocator,
            OrtMemTypeDefault);

        auto lastFrameTime = chrono::steady_clock::now();

        // Print out errors if any occur
        while (!gStopRequested)
        {
            if (rot.isFailed())
            {
                cerr << "ERROR: RoT authentication failed during runtime." << endl;
                break;
            }

            if (rot.isAlarm())
            {
                cerr << "ERROR: RoT alarm asserted during runtime." << endl;
                break;
            }

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

            frameIndex++;

            if (frameIndex == 1 || (frameIndex % inferenceInterval) == 0)
            {
                float scale = 1.0f;
                int padX = 0;
                int padY = 0;

                cv::Mat inputImage = letterbox(frame, inputWidth, inputHeight, scale, padX, padY);
                vector<float> inputTensorValues = blobFromImageYOLO(inputImage);

                Ort::Value inputTensor = Ort::Value::CreateTensor<float>(
                    memoryInfo,
                    inputTensorValues.data(),
                    inputTensorValues.size(),
                    tensorShape.data(),
                    tensorShape.size());

                auto outputTensors = session->Run(
                    Ort::RunOptions{nullptr},
                    inputNames,
                    &inputTensor,
                    1,
                    outputNames,
                    1);

                vector<int64_t> outputShape =
                    outputTensors[0].GetTensorTypeAndShapeInfo().GetShape();

                const float* outputData = outputTensors[0].GetTensorData<float>();

                lastDetections = postprocessYOLO(
                    frame,
                    outputData,
                    outputShape,
                    scale,
                    padX,
                    padY,
                    classNames,
                    confThreshold,
                    nmsThreshold);
            }

            // Send flag if person is detected
            bool personDetected = false;
            for (size_t i = 0; i < lastDetections.size(); i++)
            {
                if (lastDetections[i].classId == 0)
                {
                    personDetected = true;
                    break;
                }
            }

            writeDetectionsForFrame(outputTextDirectory, frameIndex, lastDetections, classNames);

            drawDetections(frame, lastDetections, classNames);

            auto currentTime = chrono::steady_clock::now();
            double frameTime = chrono::duration_cast<chrono::milliseconds>(
                currentTime - lastFrameTime).count() / 1000.0;
            lastFrameTime = currentTime;

            double fps = 0.0;
            if (frameTime > 0.0)
            {
                fps = 1.0 / frameTime;
            }

            string fpsText = "FPS: " + formatFloat(static_cast<float>(fps), 2);
            cv::putText(
                frame,
                fpsText,
                cv::Point(20, 30),
                cv::FONT_HERSHEY_SIMPLEX,
                0.8,
                cv::Scalar(0, 255, 255),
                2);

            if (personDetected)
            {
                cv::putText(
                    frame,
                    "PERSON DETECTED",
                    cv::Point(20, 70),
                    cv::FONT_HERSHEY_SIMPLEX,
                    0.8,
                    cv::Scalar(0, 0, 255),
                    2);

                display.writeFrame(frame);

                cout << "Person detected. Sending flag to Root of Trust." << endl;

                rot.setPersonFlag();

                usleep(250000);

                cout << "Stopping application after person detection event." << endl;
                break;
            }

            display.writeFrame(frame);
        }

        rot.clearPersonFlag();
        cap.release();
        deleteTemporaryModelFile(modelPath);
    }
    catch (const Ort::Exception& e)
    {
        deleteTemporaryModelFile("/tmp/model.onnx");
        cerr << "ERROR: ONNX Runtime exception: " << e.what() << endl;
        return 1;
    }

    return 0;
}