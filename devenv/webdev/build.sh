#!/bin/bash

# Create workspace directory if it doesn't exist
mkdir -p workspace

# Build and start the container
docker compose build && docker compose up -d

echo "Web development environment is ready!"
echo "To access the container, run: docker exec -it webdev-environment bash"
echo "Your projects will be stored in the ./workspace directory"
