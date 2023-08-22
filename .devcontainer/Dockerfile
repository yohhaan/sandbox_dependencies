FROM debian:bullseye
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y protobuf-compiler \
    python3 \
    python3-pip \
    unzip \
    wget && \
    apt-get clean autoclean && \
    apt-get autoremove
RUN pip3 install --upgrade pip && \
    pip3 install black gdown nltk pandas tflite-support-nightly
RUN addgroup --gid 1000 vscode
RUN adduser --disabled-password --gecos "" --uid 1000 --gid 1000 vscode
ENV HOME /home/vscode
USER vscode