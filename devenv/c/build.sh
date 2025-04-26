#!/bin/bash
docker compose build && docker compose up -d
echo "Development environment is ready!"
echo "To access the container, run: docker exec -it c-dev-environment bash"