# Web Development Environment

A containerized development environment for web development with Node.js and JavaScript/TypeScript frameworks.

## Features

- Ubuntu 24.04 LTS base
- Node.js LTS pre-installed
- NVM for managing multiple Node.js versions
- Multilingual support (English, Korean)
- Common global packages installed:
  - TypeScript
  - Create React App
  - Vite
  - Nx
- Persistent volume for node_modules
- Pre-configured ports for common web frameworks
- VS Code devcontainer support

## Setup

### Option 1: Using Docker Compose

1. Make sure you have Docker and Docker Compose installed
2. Run the setup script:

```bash
./build.sh
```

3. Access the container:

```bash
docker exec -it webdev-environment bash
```

### Option 2: Using VS Code Dev Containers

1. Install the "Remote - Containers" extension in VS Code
2. Open the folder containing this repository in VS Code
3. VS Code will prompt you to "Reopen in Container" - click this button
4. VS Code will build and start the container, and connect to it

## Directory Structure

- `workspace/`: This directory is mounted to `/home/bigsky033/workspace` in the container
- All your projects should be created in this directory

## Included Tools

- Node.js LTS
- npm, yarn, and pnpm
- Git
- Common build tools

## Starting a New Project

Once inside the container, you can start a new project using various frameworks:

```bash
# React project
cd workspace
create-react-app my-react-app

# Vite project
cd workspace
npm create vite@latest my-vite-app
```

## Changing Node.js Versions

You can use NVM to switch between different Node.js versions:

```bash
# List available versions
nvm ls-remote

# Install a specific version
nvm install 18

# Switch to a specific version
nvm use 18
```

## Language Support

The environment comes with support for multiple languages, including Korean. By default, it uses English (US) locale. To switch to Korean:

```bash
# Switch to Korean locale
export LANG=ko_KR.UTF-8
export LC_ALL=ko_KR.UTF-8

# Switch back to English
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
```