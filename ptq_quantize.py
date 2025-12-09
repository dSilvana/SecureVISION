import os
from onnxruntime.quantization import quantize_dynamic, QuantType

def main():
	fp32_model_path = "runs/train/securevision_yolov5n_mps_v5/weights/best.onnx"
	int8_model_path = "runs/train/securevision_yolov5n_mps_v5/weights/best_int8.onnx"

	if not os.path.isfile(fp32_model_path):
		print("ONNX file not found:", fp32_model_path)
		return

	print("Starting PTG on:", fp32_model_path)

	quantize_dynamic(
		fp32_model_path,
		int8_model_path,
		weight_type=QuantType.QInt8,
	)

	print("Done. Quantized model saved to:", int8_model_path)

if __name__ == "__main__":
	main()
