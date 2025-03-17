#!/usr/bin/env bash

set -e
set -u
set -o pipefail
set -x
shopt -s failglob


# Install celluloid, a simple GTK+ frontend for mpv
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sudo dnf remove totem 
sudo dnf install --assumeyes celluloid


# Enable hardware decoding and GPU-accelerated video output driver
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
mkdir --parents --verbose ~/.config/mpv

cat << "EOF" > ~/.config/mpv/mpv.conf
hwdec=vaapi
vo=gpu
EOF


# Celluloid preferences
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# Celluloid > Preferences > Load mpv configuration file > On
# Celluloid > Preferences > mpv configuration file > ~/.config/mpv/mpv.conf

