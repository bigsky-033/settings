#!/bin/bash

# Simple script to generate a compile_commands.json file for clangd

# Create build directory if it doesn't exist
mkdir -p build

# Generate compile_commands.json
cat > build/compile_commands.json << EOF
[
  {
    "directory": "$(pwd)",
    "command": "gcc -Wall -Wextra -g -I. -std=c11 -c -o main.o main.c",
    "file": "main.c"
  }
]
EOF

echo "compile_commands.json generated in build directory"
echo "You may need to update this file with your actual build commands and files"