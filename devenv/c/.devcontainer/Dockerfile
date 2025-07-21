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
    neovim \
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
    wget \
    software-properties-common \
    gnupg \
    lua5.4 \
    liblua5.4-dev \
    luajit \
    libluajit-5.1-dev \
    && apt-get upgrade -y \
    && yes | unminimize \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

# Install latest LLVM/Clang from official repository
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - \
    && echo "deb http://apt.llvm.org/jammy/ llvm-toolchain-jammy-20 main" >> /etc/apt/sources.list \
    && apt-get update && apt-get install -y \
    clang-20 \
    clangd-20 \
    clang-format-20 \
    clang-tidy-20 \
    lldb-20 \
    lld-20 \
    llvm-20-tools \
    libc++-20-dev \
    libc++abi-20-dev \
    bear \
    && update-alternatives --install /usr/bin/clang clang /usr/bin/clang-20 100 \
    && update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-20 100 \
    && update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-20 100 \
    && update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-20 100 \
    && update-alternatives --install /usr/bin/clang-tidy clang-tidy /usr/bin/clang-tidy-20 100 \
    && update-alternatives --install /usr/bin/lldb lldb /usr/bin/lldb-20 100 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

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
