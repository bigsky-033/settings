# Development Environment Templates

This directory contains Docker-based development environment templates for various programming languages and frameworks.

## Available Templates

- **webdev/**: Web development environment for Node.js, JavaScript, and modern web frameworks
- **c/**: C/C++ development environment

## How to Use These Templates

Each template is designed to be copied to your project directory and used as a standalone development environment.

### For Web Development (Node.js, JavaScript)

```bash
# Clone this repository (if you haven't already)
git clone https://github.com/bigsky033/settings.git

# Copy the webdev environment to your project directory
cp -r settings/devenv/webdev /path/to/your/project-directory

# Navigate to your project directory
cd /path/to/your/project-directory/webdev

# Build and start the container
./build.sh

# Access the container
docker exec -it webdev-environment bash
```

### For C/C++ Development

```bash
# Clone this repository (if you haven't already)
git clone https://github.com/bigsky033/settings.git

# Copy the C environment to your project directory
cp -r settings/devenv/c /path/to/your/project-directory

# Navigate to your project directory
cd /path/to/your/project-directory/c

# Build and start the container
./build.sh

# Access the container
docker exec -it c-dev-environment bash
```

## Customization

Each template includes its own README.md with specific instructions for customization and usage.

## Creating New Templates

To add a new template:

1. Create a new directory in `devenv/` with a descriptive name
2. Include at minimum:
   - Dockerfile
   - docker-compose.yaml
   - build.sh
   - README.md with usage instructions
   - .devcontainer/devcontainer.json (for VS Code support)