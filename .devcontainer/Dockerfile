FROM debian:bullseye
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y python3 \
    python3-pip \
    protobuf-compiler \
    wget \
    unzip && \
    apt-get clean autoclean && \
    apt-get autoremove
RUN pip3 install --upgrade pip && \
    pip3 install tflite-support-nightly pandas nltk black gdown
RUN addgroup --gid 1000 vscode
RUN adduser --disabled-password --gecos "" --uid 1000 --gid 1000 vscode
ENV HOME /home/vscode
USER vscode