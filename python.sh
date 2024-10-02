#!/usr/bin/env bash

set -e
set -u
set -o pipefail
set -x
shopt -s failglob


# Install Python 3
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sudo dnf install --assumeyes \
  python3 \
  python3-pip \
  pipx

