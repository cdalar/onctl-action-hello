#!/bin/bash

# build with Makefile
#cd ..
#make
#cd sample 


# Get OS and architecture using system commands
OS=$(uname | tr '[:upper:]' '[:lower:]') # Convert OS name to lowercase
ARCH=$(uname -m)

# Normalize architecture names
if [[ "$ARCH" == "x86_64" ]]; then
    ARCH="amd64"
elif [[ "$ARCH" == "i386" || "$ARCH" == "i686" ]]; then
    ARCH="386"
fi

# Build the binary
OUTPUT_DIR="../dist"
OUTPUT_NAME="onctl-action-hello-${OS}-${ARCH}"

# run the binary and push input.yaml 
../dist/$OUTPUT_NAME < input.yaml
