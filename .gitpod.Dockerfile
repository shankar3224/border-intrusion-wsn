FROM gitpod/workspace-full

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Pre-set keyboard configuration (no prompt)
RUN sudo apt-get update && \
    sudo apt-get install -y keyboard-configuration && \
    sudo apt-get install -y \
        default-jdk ant libncurses5-dev lib32z1 lib32stdc++6 \
        maven xorg openbox novnc websockify supervisor && \
    sudo apt-get clean

# Install Contiki-NG
RUN git clone https://github.com/contiki-ng/contiki-ng.git /workspace/contiki-ng

# Build Cooja
RUN cd /workspace/contiki-ng/tools/cooja && ant jar
