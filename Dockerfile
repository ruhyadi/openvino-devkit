# syntax=docker/dockerfile:1
FROM opencvcourses/opencv-docker:4.4.0

LABEL maintainer="Didi Ruhyadi <ruhyadi.dr@gmail.com>"

# install package
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    build-essential git nano wget zip unzip cmake pkg-config \
    ffmpeg libsm6 libxext6 && \
    rm -rf /var/cache/apk/*

# install pytorch and torchvision
RUN pip install --upgrade pip && \
    pip install --no-cache-dir torch==1.8.1+cpu torchvision==0.9.1+cpu -f https://download.pytorch.org/whl/torch_stable.html

# install openvino toolkit and runtime
RUN pip install --no-cache-dir openvino && \
    pip install --no-cache-dir openvino-dev[pytorch,onnx]

ENTRYPOINT [ "bash" ]