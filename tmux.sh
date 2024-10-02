#!/usr/bin/env bash

set -e
set -u
set -o pipefail
set -x
shopt -s failglob


# 1. Install tmux
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sudo dnf install --assumeyes tmux


# 2. Set up configuration file
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
mkdir --parents --verbose ~/.config/tmux

cp --verbose ./dotfiles/tmux/tmux.conf ~/.config/tmux
