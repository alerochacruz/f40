#!/usr/bin/env bash

set -e
set -u
set -o pipefail
set -x
shopt -s failglob


# 1. Enable alternateved/keyd COPR repository
# https://copr.fedorainfracloud.org/coprs/alternateved/keyd/
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sudo dnf copr --assumeyes enable alternateved/keyd


# 2. Install keyd
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sudo dnf install --assumeyes keyd


# 3. Set up keyd configuration file
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sudo mkdir --parents --verbose /etc/keyd

sudo tee --append /etc/keyd/default.conf > /dev/null << "EOF"
[ids]
*

[main]
# Remap Right Shift (Shift_R) to Left Alt (Alt_L)
rightshift = leftalt

# Remap Right Alt (Alt_R) to Left Shift (Shift_L)
rightalt = leftshift

# Remap Caps Lock to Left Control (Control_L)
# capslock = leftctrl
capslock = control
EOF


# 3. Set up key systemd service
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sudo systemctl restart keyd
sudo systemctl enable keyd

