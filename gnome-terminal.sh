#!/usr/bin/env bash

set -e
set -u
set -o pipefail
set -x
shopt -s failglob


# 0. Check if gsettings and python 3 are available
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# Check if gsettings is available
if ! command -v gsettings &> /dev/null
then
    echo "gsettings could not be found"
    exit 1
fi

# Check if python3 is available
if ! command -v python3 &> /dev/null
then
    echo "python3 could not be found"
    exit 1
fi

echo "Both gsettings and python3 are available"


# 1. Install Catppuccin theme for Gnome Terminal
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
CATPPUCCIN_URL="https://raw.githubusercontent.com/catppuccin/gnome-terminal/v0.3.0/install.py"

if ! curl -L "$CATPPUCCIN_URL" | python3 -; then
    echo "Failed to install Catppuccin theme"
    exit 1
fi

echo "Catppuccin theme installed successfully"


# 2. Customize Gnome Terminal settings
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# Catpuccin Mocha flavor UUID: https://github.com/catppuccin/gnome-terminal/blob/main/install.py
PROFILE_ID=95894cfd-82f7-430d-af6e-84d168bc34f5

if [ -z "$PROFILE_ID" ]; then
    echo "Profile ID not found."
    exit 1
fi

PROFILE_PATH="/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/"

# Apply settings to the profile
gsettings set org.gnome.Terminal.Legacy.Profile:"$PROFILE_PATH" audible-bell false
gsettings set org.gnome.Terminal.Legacy.Profile:"$PROFILE_PATH" use-system-font false
gsettings set org.gnome.Terminal.Legacy.Profile:"$PROFILE_PATH" cell-height-scale 1.05
gsettings set org.gnome.Terminal.Legacy.Profile:"$PROFILE_PATH" scrollbar-policy 'never'
gsettings set org.gnome.Terminal.Legacy.Profile:"$PROFILE_PATH" font 'Source Code Pro 15'

# Set the profile as default
gsettings set org.gnome.Terminal.ProfilesList default "$PROFILE_ID"

echo "Profile settings applied and set as default for ID: $PROFILE_ID"

