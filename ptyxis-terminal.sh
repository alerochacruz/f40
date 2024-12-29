#!/usr/bin/env bash

set -e
set -u
set -o pipefail
set -x
shopt -s failglob


# 0. Check if gsettings is available
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# Check if gsettings is available
if ! command -v gsettings &> /dev/null
then
    echo "gsettings could not be found"
    exit 1
fi

echo "gsettings is available"


# 1. Customize Ptyxis terminal settings
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
gsettings set org.gnome.Ptyxis.Profile:/org/gnome/Ptyxis/Profiles/"$PTYXIS_PROFILE"/ palette 'Catppuccin Mocha'
gsettings set org.gnome.Ptyxis audible-bell false
gsettings set org.gnome.Ptyxis use-system-font false
gsettings set org.gnome.Ptyxis scrollbar-policy 'never'
gsettings set org.gnome.Ptyxis font-name 'Source Code Pro 15'

