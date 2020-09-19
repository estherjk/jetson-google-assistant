# See https://ngc.nvidia.com/catalog/containers/nvidia:l4t-base
FROM nvcr.io/nvidia/l4t-base:r32.4.3

# Install dependencies
RUN apt update
RUN apt install -y alsa alsa-utils alsa-tools

# Run the image as a non-root user
ARG uid=1000
ARG gid=1000
RUN groupadd --gid ${gid} developer \
    && useradd --uid ${uid} --gid ${gid} developer \
    && adduser developer audio
USER developer

