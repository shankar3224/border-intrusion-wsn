# .gitpod.Dockerfile
FROM gitpod/workspace-full-vnc

USER root

# Avoid any interactive prompts during build
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y \
      openjdk-11-jdk \
      ant \
      git \
      wget \
      unzip \
      build-essential \
      python3 \
      python3-pip \
      bc \
      ca-certificates \
      x11vnc \
      xvfb \
      && apt-get clean && rm -rf /var/lib/apt/lists/*

USER gitpod
ENV HOME=/home/gitpod
