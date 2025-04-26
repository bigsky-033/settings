FROM --platform=linux/amd64 ubuntu:22.04

# Install essential packages with minimal layers and cleanup to reduce image size
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    gdb \
    make \
    cmake \
    git \
    vim \
    gcc-multilib \
    tcsh \
    perl \
    libc6-dev-i386 \
    valgrind \
    curl \
    libcurl4-openssl-dev \
    sudo \
    ssh \
    ca-certificates \
    man-db \
    manpages-posix \
    manpages-dev \
    strace \
    locales \
    clangd \
    clang \
    clang-format \
    clang-tidy \
    lldb \
    bear \
    && apt-get upgrade -y \
    && yes | unminimize \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

# Set up non-root user with sudo access
RUN useradd -ms /bin/bash bigsky033 && \
    echo "bigsky033 ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/bigsky033 && \
    chmod 0440 /etc/sudoers.d/bigsky033

# Set locale environment variables
ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

USER bigsky033
WORKDIR /home/bigsky033

# Keep container running
CMD ["bash"]
