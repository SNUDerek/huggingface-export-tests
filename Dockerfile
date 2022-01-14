# start from TensorRT latest
FROM nvcr.io/nvidia/tensorrt:21.12-py3

# for soundfile
RUN apt-get update && apt-get install -y libsndfile-dev

# all python crap
RUN pip install torch==1.10.1+cu113 torchvision==0.11.2+cu113 torchaudio==0.10.1+cu113 -f https://download.pytorch.org/whl/cu113/torch_stable.html && \
    pip install torch-tensorrt -f https://github.com/NVIDIA/Torch-TensorRT/releases && \
    pip install jupyterlab onnxmltools pynvml soundfile transformers transformers[onnx] datasets && \
    # something above installs cpu onnxruntime 1.10 so rm it first
    pip uninstall onnxruntime && \
    pip install onnxruntime-gpu==1.9.0  && \
    pip install --upgrade ipywidgets
