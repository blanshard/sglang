docker build --build-arg http_proxy=$http_proxy \
                --build-arg https_proxy=$https_proxy \
                --build-arg no_proxy=" " \
                --build-arg NO_PROXY=" " \
                --rm --no-cache --progress=plain \
                -t sglang-xpu:latest .