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