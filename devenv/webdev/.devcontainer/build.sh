#!/bin/bash

# Build and start the container
docker compose -f .devcontainer/docker-compose.yaml build && docker compose -f .devcontainer/docker-compose.yaml up -d

# Note: node_modules permissions are automatically fixed by postCreateCommand in devcontainer.json

echo "Web development environment is ready!"
echo "To access the container, run: docker exec -it webdev-environment bash"
echo "Your project code is mounted at /home/bigsky033/app inside the container"