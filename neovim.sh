#!/usr/bin/env bash

set -e
set -u
set -o pipefail
set -x
shopt -s failglob


# 0. Obliterate Nano
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sudo dnf remove --assumeyes nano nano-default-editor
sudo dnf autoremove --assumeyes


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


# 3. Set up configuration files
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
mkdir --parents --verbose ~/.config
cp --archive --verbose ./dotfiles/nvim ~/.config

