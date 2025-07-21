# C Development Environment

A containerized development environment for C programming with LLVM/Clang 20 toolchain and clangd integration.

## Features

- Ubuntu 22.04 base image
- GCC and Clang 20 compilers (latest LLVM toolchain)
- GDB and LLDB debuggers
- CMake build system
- Valgrind memory checker
- clangd-20 for code intelligence
- clang-format-20 for code formatting
- clang-tidy-20 for static analysis
- Vim and Neovim editors with Lua runtime support
- VSCode integration via devcontainer

## How to Use This Template

This template is designed to be copied into your C/C++ project and provide a consistent, isolated development environment.

### Option 1: Use the Setup Script (Recommended)

A helper script is provided to automatically set up the environment for your project:

```bash
# Run the setup script
/path/to/settings/devenv/c/setup-project.sh
```

The script will:
1. Ask for your project directory
2. Generate a unique container name based on your project
3. Copy all required files with proper configuration
4. Provide instructions for next steps

### Option 2: Manual Setup

If you prefer to set up manually:

```bash
# Create a new project directory if needed
mkdir my-c-project
cd my-c-project

# Create .devcontainer directory
mkdir -p .devcontainer

# Copy Docker files to .devcontainer
cp -r /path/to/settings/devenv/c/.devcontainer/* .devcontainer/

# Edit docker-compose.yaml to change the container name to something unique
sed -i 's/container_name: c-dev-environment/container_name: my-c-project-dev/' .devcontainer/docker-compose.yaml

# Make the build script executable and create a symlink in the root
chmod +x .devcontainer/build.sh
ln -s .devcontainer/build.sh build.sh
ln -s .devcontainer/generate_compile_commands.sh generate_compile_commands.sh

# Copy .clang-format to project root for code formatting
cp /path/to/settings/devenv/c/.clang-format .
```

### Using with VS Code (Recommended)

1. Open VS Code
2. Open your project folder
3. When prompted, click "Reopen in Container" (or click the green icon in the bottom-left corner and select "Reopen in Container")
4. VS Code will build the container and set up the development environment

### Manual Start

If you prefer not to use VS Code's devcontainer feature:

```bash
# Build and start the container
./build.sh

# Attach to the container
docker exec -it c-dev-environment bash  # or your custom container name
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

## Directory Structure

- `.devcontainer/`
  - `Dockerfile` - Defines the container environment (x86_64 architecture with LLVM 20)
  - `docker-compose.yaml` - Configures container settings and port mappings
  - `build.sh` - Script to build and start the container
  - `devcontainer.json` - VS Code Dev Containers configuration
  - `generate_compile_commands.sh` - Helper script for clangd
- `.clang-format` - Code formatting configuration (LLVM style with custom settings)
- `build.sh` (symlink) - Convenient link to the build script inside .devcontainer
- `generate_compile_commands.sh` (symlink) - Convenient link to the helper script inside .devcontainer

## Customizing Your Environment

### Project-Specific Container Name

Edit `.devcontainer/docker-compose.yaml` to change the container name:

```yaml
container_name: my-project-c-dev  # instead of c-dev-environment
```

### Adding Development Tools

You can customize the Dockerfile to add additional development tools:

```dockerfile
RUN apt-get update && apt-get install -y \
    your-package-name \
    another-package
```
