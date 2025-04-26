# Web Development Project Environment

A containerized development environment for Node.js web projects with optimized persistent dependencies.

## Features

- Ubuntu 24.04 LTS base
- Node.js LTS pre-installed
- NVM for managing multiple Node.js versions
- Multilingual support (English, Korean)
- Common global packages installed
- Persistent volume for node_modules (faster installs, better performance)
- Pre-configured ports for common web frameworks
- VS Code devcontainer support

## How to Use This Template

This template is designed to be copied into your Node.js project and provide a consistent, isolated development environment.

### Step 1: Copy Template Files to Your Project

```bash
# Create a new project directory if needed
mkdir my-awesome-project
cd my-awesome-project

# Copy the webdev environment files to your project
cp -r /path/to/settings/devenv/webdev/{Dockerfile,docker-compose.yaml,build.sh,.devcontainer} .

# Make the build script executable
chmod +x build.sh
```

### Step 2: Initialize Your Project (If New)

If this is a new project, initialize it:

```bash
# Initialize a new Node.js project
npm init -y

# OR use a framework
npx create-react-app .
# OR
npm create vite@latest .
```

### Step 3: Start the Development Environment

```bash
# Build and start the container
./build.sh

# Access the container shell
docker exec -it webdev-environment bash
```

### Step 4: Work with Your Project

Inside the container, your project is available at `/home/bigsky033/app`.

```bash
# Inside the container
cd /home/bigsky033/app

# Install dependencies
npm install

# Start development server
npm start  # or npm run dev
```

## Using VS Code Dev Containers

For the best development experience:

1. Install the "Remote - Containers" extension in VS Code
2. Open your project folder in VS Code
3. VS Code will detect the devcontainer configuration and prompt you to "Reopen in Container"
4. VS Code will open inside the container, with full extension support

## Understanding the Setup

- Your project files are mounted at `/home/bigsky033/app` inside the container
- The `node_modules` directory uses a Docker volume for better performance
- This approach prevents node_modules from syncing to your host, which:
  - Improves performance (especially on macOS/Windows)
  - Avoids platform-specific binary issues
  - Reduces disk usage on your host machine

## Customizing Your Environment

### Project-Specific Container Name

Edit `docker-compose.yaml` to change the container name:

```yaml
container_name: my-project-name  # instead of webdev-environment
```

### Adding Dependencies to package.json

Any changes to your package.json will be visible inside the container. To install dependencies:

```bash
# Inside the container
npm install some-package
# OR
npm install some-dev-package --save-dev
```

The dependencies will be installed to the volume-mounted node_modules and persist across container restarts.

### Changing Node.js Version

Inside the container, use NVM:

```bash
# List available versions
nvm ls-remote

# Install a specific version
nvm install 18

# Switch to a specific version
nvm use 18
```

## Troubleshooting

### Container Won't Start

Check if the ports are already in use:

```bash
lsof -i :3000
```

### Node Modules Issues

If you encounter permission problems:

```bash
# Inside the container
sudo chown -R bigsky033:bigsky033 /home/bigsky033/app
```

### Korean Language Support

To switch to Korean locale:

```bash
export LANG=ko_KR.UTF-8
export LC_ALL=ko_KR.UTF-8
```