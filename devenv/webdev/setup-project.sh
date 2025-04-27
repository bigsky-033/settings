#!/bin/bash

# ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

print_header() {
    echo -e "\n${BLUE}=== $1 ===${NC}\n"
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}! $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

# Welcome message
clear
echo -e "${BLUE}===============================================${NC}"
echo -e "${BLUE}     Web Development Environment Setup     ${NC}"
echo -e "${BLUE}===============================================${NC}"
echo -e "\nThis script will set up a Docker-based development environment for your project."

# Get target directory
print_header "PROJECT LOCATION"
read -p "Enter the target project directory (absolute path or relative to current directory): " TARGET_DIR

# Validate and create target directory if it doesn't exist
if [[ ! -d "$TARGET_DIR" ]]; then
    read -p "Directory doesn't exist. Create it? (y/n): " CREATE_DIR
    if [[ "$CREATE_DIR" =~ ^[Yy]$ ]]; then
        mkdir -p "$TARGET_DIR"
        print_success "Created directory: $TARGET_DIR"
    else
        print_error "Setup cancelled. Target directory doesn't exist."
        exit 1
    fi
fi

# Check if target directory is not empty
if [[ "$(ls -A "$TARGET_DIR")" ]]; then
    echo -e "\n${YELLOW}Warning: Target directory is not empty.${NC}"
    read -p "Continue anyway? (y/n): " CONTINUE
    if [[ ! "$CONTINUE" =~ ^[Yy]$ ]]; then
        print_error "Setup cancelled."
        exit 1
    fi
fi

# Get container name
print_header "CONTAINER CONFIGURATION"
# Generate default container name from directory name
DEFAULT_CONTAINER_NAME="$(basename "$TARGET_DIR" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g')-dev"
read -p "Enter container name (default: $DEFAULT_CONTAINER_NAME): " CONTAINER_NAME
CONTAINER_NAME=${CONTAINER_NAME:-$DEFAULT_CONTAINER_NAME}

# Get source directory (where the template is located)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

# Copy template files
print_header "COPYING FILES"
echo "Copying environment files to $TARGET_DIR..."

# Create .devcontainer directory
mkdir -p "$TARGET_DIR/.devcontainer"

# Copy .devcontainer files with substitution
cp "$SCRIPT_DIR/.devcontainer/Dockerfile" "$TARGET_DIR/.devcontainer/"
print_success "Copied Dockerfile to .devcontainer/"

# Copy docker-compose.yaml with container name substitution
sed "s/container_name: webdev-environment/container_name: $CONTAINER_NAME/" "$SCRIPT_DIR/.devcontainer/docker-compose.yaml" > "$TARGET_DIR/.devcontainer/docker-compose.yaml"
print_success "Copied and configured docker-compose.yaml to .devcontainer/"

# Copy build.sh with container name substitution
sed "s/webdev-environment/$CONTAINER_NAME/g" "$SCRIPT_DIR/.devcontainer/build.sh" > "$TARGET_DIR/.devcontainer/build.sh"
chmod +x "$TARGET_DIR/.devcontainer/build.sh"
print_success "Copied and configured build.sh to .devcontainer/"

# Create convenience symlink for build.sh in the project root
ln -s ".devcontainer/build.sh" "$TARGET_DIR/build.sh"
print_success "Created convenience symlink for build.sh in project root"

# Copy devcontainer.json with container name substitution
cp "$SCRIPT_DIR/.devcontainer/devcontainer.json" "$TARGET_DIR/.devcontainer/"
sed -i '' "s/\"name\": \"Web Development Environment\"/\"name\": \"$CONTAINER_NAME\"/" "$TARGET_DIR/.devcontainer/devcontainer.json"
# Update container name in postCreateCommand
sed -i '' "s/webdev-environment/$CONTAINER_NAME/g" "$TARGET_DIR/.devcontainer/devcontainer.json"
print_success "Copied and configured devcontainer.json"

# Copy .gitignore
cp "$SCRIPT_DIR/.gitignore" "$TARGET_DIR/"
print_success "Copied .gitignore"

# Ask if user wants to copy the test app
print_header "TEST APPLICATION"
read -p "Would you like to copy the test application to verify your setup? (y/n): " COPY_TEST_APP
if [[ "$COPY_TEST_APP" =~ ^[Yy]$ ]]; then
    cp -r "$SCRIPT_DIR/test-app/"* "$TARGET_DIR/"
    print_success "Copied test application"
fi

# Display success message and next steps
print_header "SETUP COMPLETE"
echo -e "Your development environment has been set up successfully in: ${GREEN}$TARGET_DIR${NC}"
echo -e "\n${BLUE}Next steps:${NC}"
echo -e "1. Navigate to your project directory: ${YELLOW}cd $TARGET_DIR${NC}"
echo -e "2. Start your development environment: ${YELLOW}./build.sh${NC}"
echo -e "3. Access your container: ${YELLOW}docker exec -it $CONTAINER_NAME bash${NC}"

if [[ "$COPY_TEST_APP" =~ ^[Yy]$ ]]; then
    echo -e "4. Install dependencies and start the test app: ${YELLOW}npm install && npm run dev${NC}"
    echo -e "5. Visit ${YELLOW}http://localhost:8080${NC} in your browser to verify your setup"
fi

echo -e "\n${BLUE}Happy coding!${NC}\n"