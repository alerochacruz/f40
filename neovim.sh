#!/usr/bin/env bash

set -e
set -u
set -o pipefail
set -x
shopt -s failglob


# 0. Obliterate Nano
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sudo dnf remove --assumeyes nano nano-default-editor
sudo dnf autoremove


# 1. Install Neovim
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sudo dnf install --assumeyes neovim


# 2. Set Neovim as the default text editor
# Find the path of Neovim executable with `which nvim`
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

cat << "EOF" >> ~/.bash_profile

# Set Neovim as the default text editor
export EDITOR=/usr/bin/nvim
EOF

