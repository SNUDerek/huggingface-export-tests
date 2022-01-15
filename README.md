# Huggingface to ONNX, TensorRT tests

just testing exports with latest libraries

## current status

see the notebook(s) inside the `/mounted` directory to see current test status.

## base system info

```
CPU device    : AMD Ryzen 7 3700X
GPU device    : Nvidia RTX 2080Ti
linux distro  : Ubuntu 18.04
nvidia driver : 510.39.01
CUDA version  : 11.6, V11.6.55
CUDnn version : 8.3.2 (January 10th, 2022), for CUDA 11.5
Docker version: 20.10.3, build 48d30b5
```

## docker image info

```
linux distro  : Ubuntu 20.04.3
nvidia driver : 510.39.01
CUDA version  : 11.5, V11.5.50
TensorRT ver  : 8.2.1-1+cuda11.4
Python   ver  : 3.8.10
PyTorch  ver  : 1.10.1+cu113
ONNX runtime  : 1.9.0 (gpu)
```

this repo will run on base systems with any CUDA 11.x setup but may run with reduced functionality if CUDA support < 11.5

see more about [CUDA Minor Version Compatibility](https://docs.nvidia.com/deploy/cuda-compatibility/#minor-version-compatibility)

## start image

```
docker build -t pytorch-export:latest .

docker run --gpus all -it --rm --network=host --ipc=host --ulimit memlock=-1 -v $PWD/mounted:/workspace/mounted --ulimit stack=67108864 pytorch-export:latest
```

## run notebook

```
(from container, edit port as desired) jupyter lab --no-browser --allow-root --ip 0.0.0.0 --port 9999

then navigate to given url and edit hostname:8888 to proper domain, port
```