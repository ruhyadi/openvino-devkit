# syntax=docker/dockerfile:1
FROM openvino/ubuntu20_dev:latest

USER root

LABEL maintainer="Didi Ruhyadi <ruhyadi.dr@gmail.com>"

# install package
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    build-essential git nano wget zip unzip cmake pkg-config \
    ffmpeg libsm6 libxext6 && \
    rm -rf /var/cache/apk/*

ENTRYPOINT [ "bash" ]