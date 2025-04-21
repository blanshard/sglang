# sglang-xpu Image: Build and Usage Guide

This document outlines the steps to build and use the `sglang-xpu` Docker image, including inference, serving, and benchmarking functionalities for XPU.

---

## 1. Build the Image

To build the `sglang-xpu` Docker image, use the following command:

```bash
./build.sh
```

---

## 2. Using the Image for XPU Inference

To use the `sglang-xpu` docker image, you can run the command:
```bash
./run.sh
```

You might want to change the mapped workspace folder in the shell script:

```bash
#/bin/bash
export DOCKER_IMAGE=sglang-xpu:latest
sudo docker run --rm \
        --net=host \
        --privileged \
        --device=/dev/dri \
        -v /path/to/models:/llm/models \
        -v /path/to/workspace:/workspace \
        -e http_proxy=$http_proxy \
        -e https_proxy=$https_proxy \
        -e no_proxy=localhost,127.0.0.1 \
        --memory="32G" \
        --shm-size="16g" \
        --entrypoint /bin/bash \
        -it \
        $DOCKER_IMAGE
```

Once the container is up and running, to verify if the XPU device is successfully mapped into the container, run the following:

```bash
sycl-ls
```

## 3. Using the Image for development

### 3.1 **Start the Container**

After the modification of the volume you'd like to map,

```bash
./run.sh
```

### 3.2 **Install SGLang Dev code**

Go to your SGLang development repo folder (in the container):

```bash
pip install -e "python[all_xpu]"
huggingface-cli login --token “YOUR_HUGGINGFACE_TOKEN”
```
### 3.3 Serving and benchmarking

#### 3.3.1 Start the server

```bash
python3 -m sglang.launch_server --model meta-llama/Llama-3.2-1B-Instruct &
```

#### 3.3.2 Run a simple benchmark

```bash
python3 -m sglang.bench_serving --backend sglang --dataset-name random --num-prompts 1 --random-input 1024 --random-output 512 --host 127.0.0.1
```


## 4. Tips

To be added
