#!/usr/bin/env bash

set -e
set -u
set -o pipefail
set -x
shopt -s failglob


# 1. Install extra tools
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sudo dnf install --assumeyes \
  fzf \
  fd-find \
  ripgrep \
  ncdu \
  bat \
  shellcheck


# 2. Install vimv
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sudo curl \
  --output /usr/local/bin/vimv \
  https://raw.githubusercontent.com/thameera/vimv/master/vimv

sudo chmod +x /usr/local/bin/vimv


# 3. Set up fzf configuration in ~/.bashrc
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
cat << "EOF" >> ~/.bashrc

# Source fzf key bindings
. /usr/share/fzf/shell/key-bindings.bash
# Shell completion for fzf is already enabled
# "In Fedora, we only enable the shell completion..."

# Catppuccin Mocha theme for fzf
# https://github.com/catppuccin/fzf
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# Catppuccin Latte theme for fzf
# https://github.com/catppuccin/fzf
# export FZF_DEFAULT_OPTS=" \
#     --color=bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#d20f39 \
#     --color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78 \
#     --color=marker:#dc8a78,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39"
EOF


# 4. Set up bat configuration
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
mkdir --parents --verbose ~/.config
cp --archive --verbose ./dotfiles/bat ~/.config
bat cache --build

