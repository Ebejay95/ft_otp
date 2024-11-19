FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-venv \
    exiftool \
    && apt clean && rm -rf /var/lib/apt/lists/*

RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --no-cache-dir \
    requests \
    beautifulsoup4 \
    Pillow \
    humanize

ENV PATH="/opt/venv/bin:$PATH"
WORKDIR /

# docker build -t python_dev .
# 
# docker ps -a
# docker images
# docker rm
# docker rmi

# adduser test
# su test