# C Development Environment

A containerized development environment for C programming with clangd integration.

## Features

- Ubuntu 22.04 base image
- GCC and Clang compilers
- GDB and LLDB debuggers
- CMake build system
- Valgrind memory checker
- clangd for code intelligence
- clang-format for code formatting
- clang-tidy for static analysis
- VSCode integration via devcontainer

## Getting Started

### Prerequisites

- [Docker](https://www.docker.com/get-started)
- [Visual Studio Code](https://code.visualstudio.com/)
- [VS Code Remote - Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

### Using with VS Code (Recommended)

1. Open VS Code
2. Open the folder containing this repository
3. When prompted, click "Reopen in Container" (or click the green icon in the bottom-left corner and select "Reopen in Container")
4. VS Code will build the container and set up the development environment

### Manual Start

If you prefer not to use VS Code's devcontainer feature:

```bash
# Build and start the container
docker-compose up -d

# Attach to the container
docker exec -it c-dev-environment bash
```

## Generating compile_commands.json

For clangd to work properly, it needs a compile_commands.json file. You can generate this:

1. Using CMake (recommended):
   ```bash
   mkdir -p build && cd build
   cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..
   ln -s build/compile_commands.json .
   ```

2. Using the provided script (for simple projects):
   ```bash
   ./generate_compile_commands.sh
   # Edit the generated file in build/compile_commands.json as needed
   ```

3. Using Bear (for Makefile projects):
   ```bash
   bear -- make
   ```

## Important Files

- `.devcontainer/` - VS Code devcontainer configuration
- `.clang-format` - Configuration for code formatting
- `Dockerfile` - Container definition
- `docker-compose.yaml` - Container orchestration
- `generate_compile_commands.sh` - Helper script for clangd
