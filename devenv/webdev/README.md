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

### Option 1: Use the Setup Script (Recommended)

A helper script is provided to automatically set up the environment for your project:

```bash
# Run the setup script
/path/to/settings/devenv/webdev/setup-project.sh
```

The script will:
1. Ask for your project directory
2. Generate a unique container name based on your project
3. Copy all required files with proper configuration
4. Optionally copy the test application
5. Provide instructions for next steps

### Option 2: Manual Setup

If you prefer to set up manually:

```bash
# Create a new project directory if needed
mkdir my-awesome-project
cd my-awesome-project

# Create .devcontainer directory
mkdir -p .devcontainer

# Copy Docker files to .devcontainer
cp -r /path/to/settings/devenv/webdev/Dockerfile .devcontainer/
cp -r /path/to/settings/devenv/webdev/docker-compose.yaml .devcontainer/
cp -r /path/to/settings/devenv/webdev/build.sh .devcontainer/
cp -r /path/to/settings/devenv/webdev/.devcontainer/devcontainer.json .devcontainer/

# Edit docker-compose.yaml to change the container name to something unique
sed -i 's/container_name: webdev-environment/container_name: my-awesome-project-dev/' .devcontainer/docker-compose.yaml

# Edit devcontainer.json to point to the local docker-compose file
sed -i 's/"dockerComposeFile": "..\/docker-compose.yaml"/"dockerComposeFile": "docker-compose.yaml"/' .devcontainer/devcontainer.json

# Make the build script executable and create a symlink in the root
chmod +x .devcontainer/build.sh
ln -s .devcontainer/build.sh build.sh
```

### Step 3: Initialize Your Project (If New)

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

## Directory Structure

- `.devcontainer/`
  - `Dockerfile` - Defines the container environment
  - `docker-compose.yaml` - Configures container settings and port mappings
  - `build.sh` - Script to build and start the container
  - `devcontainer.json` - VS Code Dev Containers configuration
- `build.sh` (symlink) - Convenient link to the build script inside .devcontainer

## Understanding the Setup

- Your project files are mounted at `/home/bigsky033/app` inside the container
- The `node_modules` directory uses a Docker volume for better performance
- This approach prevents node_modules from syncing to your host, which:
  - Improves performance (especially on macOS/Windows)
  - Avoids platform-specific binary issues
  - Reduces disk usage on your host machine

## Example Application

A basic test application is included in the `test-app` directory. You can use this to verify your environment setup:

1. Copy the test app to your project directory:
```bash
cp -r /path/to/settings/devenv/webdev/test-app/* .
```

2. Start the container and run the app:
```bash
./build.sh
docker exec -it webdev-environment bash
cd /home/bigsky033/app
npm install
npm run dev
```

3. Visit http://localhost:8080 in your browser to see the test application

## Customizing Your Environment

### Project-Specific Container Name

Edit `.devcontainer/docker-compose.yaml` to change the container name:

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

### Node Modules Permission Issues

If you encounter "EACCES: permission denied" when installing packages:

```bash
# Method 1: Fix permissions (inside the container)
sudo chown -R bigsky033:bigsky033 /home/bigsky033/app
sudo chmod -R 755 /home/bigsky033/app/node_modules

# Method 2: Use the --unsafe-perm flag with npm
npm install --unsafe-perm

# Method 3: If the above doesn't work, you can recreate the volume
# (outside the container, stop it first)
docker compose down
docker volume rm webdev_node_modules
docker compose up -d
```

### Korean Language Support

To switch to Korean locale:

```bash
export LANG=ko_KR.UTF-8
export LC_ALL=ko_KR.UTF-8
```