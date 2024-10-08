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


# 3. Clone TPM
# Inside tmux, press <prefix> + I (capital i, as in Install) to fetch the plugins
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

