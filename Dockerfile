# syntax=docker/dockerfile:1
FROM openvino/ubuntu20_dev:2022.2.0

USER root

LABEL maintainer="Didi Ruhyadi <ruhyadi.dr@gmail.com>"

# install package
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    build-essential git nano wget zip unzip cmake pkg-config \
    ffmpeg libsm6 libxext6 && \
    rm -rf /var/cache/apk/*

# build opencv
RUN cd /opt/intel/openvino/extras/scripts/ && sh download_opencv.sh

WORKDIR /opt/intel/openvino

ENTRYPOINT [ "bash" ]