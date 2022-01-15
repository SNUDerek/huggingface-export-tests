# start from TensorRT latest
FROM nvcr.io/nvidia/tensorrt:21.12-py3

# for soundfile
RUN apt-get update && apt-get install -y libsndfile-dev

# all python crap
RUN pip install torch==1.10.1+cu113 torchvision==0.11.2+cu113 torchaudio==0.10.1+cu113 -f https://download.pytorch.org/whl/cu113/torch_stable.html && \
    pip install torch-tensorrt -f https://github.com/NVIDIA/Torch-TensorRT/releases && \
    pip install onnxmltools pynvml soundfile transformers transformers[onnx] datasets && \
    # something above installs cpu onnxruntime 1.10 so rm it first
    # we need to install the GPU version
    # v1.10 only works on CUDA 11.4,
    # v1.9.0 works with base system CUDA versions below this
    pip uninstall -y onnxruntime && \
    pip install onnxruntime-gpu==1.9.0  && \
    # additional libs for notebook access, huggingface CER, data viz
    pip install jupyterlab jiwer librosa seaborn && \
    pip install --upgrade ipywidgets
