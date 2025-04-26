#!/bin/bash

# Build and start the container
docker compose build && docker compose up -d

echo "Web development environment is ready!"
echo "To access the container, run: docker exec -it webdev-environment bash"
echo "Your project code is mounted at /home/bigsky033/app inside the container"
