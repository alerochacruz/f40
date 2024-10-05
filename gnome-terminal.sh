#!/usr/bin/env bash

set -e
set -u
set -o pipefail
set -x
shopt -s failglob


# 0. Check if gsttings and python 3 are available
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


# 1. Install Catppuccin for Gnome Terminal
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
curl -L https://raw.githubusercontent.com/catppuccin/gnome-terminal/v0.3.0/install.py | python3 -


# 2. Customize settings with dconf
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# Retrieve the profile ID for visible-name='Catppuccin Mocha'
PROFILE_ID=$(dconf dump /org/gnome/terminal/legacy/profiles:/ | grep -B 1 "background-color='#1e1e2e'" | head -n 1 | sed 's/\[://;s/\]//')

if [ -z "$PROFILE_ID" ]; then
    echo "Profile ID not found."
    exit 1
fi

# Apply settings to the profile
dconf write /org/gnome/terminal/legacy/profiles:/:"$PROFILE_ID"/audible-bell false
dconf write /org/gnome/terminal/legacy/profiles:/:"$PROFILE_ID"/cell-height-scale 1.05
dconf write /org/gnome/terminal/legacy/profiles:/:"$PROFILE_ID"/scrollbar-policy "'never'"
dconf write /org/gnome/terminal/legacy/profiles:/:"$PROFILE_ID"/font "'Source Code Pro 15'"

# Set the profile as default
# Note: Replace 'your-profile-id-here' with the actual ID if you want to hardcode it or keep it dynamic as below
dconf write /org/gnome/terminal/legacy/default-profile "'$PROFILE_ID'"

echo "Profile settings applied and set as default for ID: $PROFILE_ID"

