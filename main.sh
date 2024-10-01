#!/usr/bin/env bash

set -e                # Exit immediately if a command exits with a non-zero status
set -u                # Treat unset variables as an error and exit immediately
set -o pipefail       # Ensure the script exits if any command in a pipeline fails
set -x                # Enable debugging mode
shopt -s failglob     # Fail if a glob pattern does not match any files


./rpm-fusion.sh
./bash-config.sh
./liquid-prompt.sh
./key-remaps-wayland.sh
./alacritty.sh
