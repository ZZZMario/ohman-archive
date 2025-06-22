#!/bin/bash
check_success() {
    if [ $? -ne 0 ]; then
        echo "Got an Error: $1"
        exit 1
    fi
}

echo "Installing packages..."
sudo apt install build-essential bsdmainutils git python3 libglew-dev libsdl2-dev
check_success "Package installation"


echo "Running make..."
make BETTERCAMERA=1 EXTERNAL_DATA=1 -j4
check_success "Make command"

echo "All commands were executed successfully."
