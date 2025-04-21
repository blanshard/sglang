#/bin/bash
export DOCKER_IMAGE=sglang-xpu:latest
sudo docker run --rm \
        --net=host \
        --privileged \
        --device=/dev/dri \
        -v /path/to/models:/llm/models \
        -v /home/wfang/workspace:/workspace \
        -e http_proxy=$http_proxy \
        -e https_proxy=$https_proxy \
        -e no_proxy=localhost,127.0.0.1 \
        --memory="32G" \
        --shm-size="16g" \
        --entrypoint /bin/bash \
        -it \
        $DOCKER_IMAGE