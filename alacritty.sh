#!/usr/bin/env bash

set -e
set -u
set -o pipefail
set -x
shopt -s failglob


# Install Alacritty
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sudo dnf install --assumeyes alacritty


# Make configuration directory
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
mkdir --parents --verbose ~/.config/alacritty


# Download catpuccin color schemes
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
curl \
  --location \
  --remote-name \
  --output-dir ~/.config/alacritty \
  https://github.com/catppuccin/alacritty/raw/main/catppuccin-latte.toml

curl \
  --location \
  --remote-name \
  --output-dir ~/.config/alacritty \
  https://github.com/catppuccin/alacritty/raw/main/catppuccin-frappe.toml

curl \
  --location \
  --remote-name \
  --output-dir ~/.config/alacritty \
  https://github.com/catppuccin/alacritty/raw/main/catppuccin-macchiato.toml

curl \
  --location \
  --remote-name \
  --output-dir ~/.config/alacritty \
  https://github.com/catppuccin/alacritty/raw/main/catppuccin-mocha.toml


# Set up configuration file
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
cat << "EOF" > ~/.config/alacritty/alacritty.toml
import = [
  # uncomment the flavour you want below:
  # "~/.config/alacritty/catppuccin-latte.toml"
  # "~/.config/alacritty/catppuccin-frappe.toml"
  # "~/.config/alacritty/catppuccin-macchiato.toml"
  "~/.config/alacritty/catppuccin-mocha.toml"
]

[font]
size = 15.0

[font.bold]
family = "Source Code Pro"
style = "Bold"

[font.bold_italic]
family = "Source Code Pro"
style = "Bold"

[font.italic]
family = "Source Code Pro"
style = "Medium"

[font.normal]
family = "Source Code Pro"
style = "Regular"
EOF

