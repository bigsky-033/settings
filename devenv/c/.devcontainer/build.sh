#!/bin/bash
docker compose -f .devcontainer/docker-compose.yaml build && docker compose -f .devcontainer/docker-compose.yaml up -d
echo "C/C++ development environment is ready!"
echo "To access the container, run: docker exec -it c-dev-environment bash"