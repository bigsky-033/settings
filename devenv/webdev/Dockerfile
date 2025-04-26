FROM ubuntu:24.04

# Install essential packages with minimal layers and cleanup to reduce image size
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    vim \
    curl \
    wget \
    sudo \
    ssh \
    ca-certificates \
    gnupg \
    locales \
    fonts-noto \
    fonts-noto-cjk \
    language-pack-ko \
    language-pack-en \
    unzip \
    zip \
    && apt-get upgrade -y \
    && yes | unminimize \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set up locales
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
    && localedef -i ko_KR -c -f UTF-8 -A /usr/share/locale/locale.alias ko_KR.UTF-8

# Set up Node.js repository and install Node.js LTS
RUN mkdir -p /etc/apt/keyrings \
    && curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
    && echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" > /etc/apt/sources.list.d/nodesource.list \
    && apt-get update \
    && apt-get install -y nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install global Node.js packages
RUN npm install -g npm@latest yarn pnpm typescript nx vite create-react-app

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

# Configure bash for Korean locale support
RUN echo 'export LANG=en_US.UTF-8' >> ~/.bashrc \
    && echo 'export LC_ALL=en_US.UTF-8' >> ~/.bashrc \
    && echo 'export LANGUAGE=en_US:en' >> ~/.bashrc \
    && echo '# Korean locale is available with: export LANG=ko_KR.UTF-8' >> ~/.bashrc

# Setting up NVM for managing different Node.js versions
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash \
    && echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc \
    && echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.bashrc \
    && echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> ~/.bashrc

# Keep container running
CMD ["bash"]
