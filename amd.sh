#!/usr/bin/env bash

set -e
set -u
set -o pipefail
set -x
shopt -s failglob


# Hardware video decoding with VA-API
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# libva is probably already installed
sudo dnf install --assumeyes \
  ffmpeg-libs \
  libva \
  libva-utils


# These drivers contains video acceleration codecs for decoding/encoding
# H.264 and H.265 algorithms and decoding only VC1 algorithm.
# Mesa-based VA-API drivers.
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sudo dnf swap mesa-va-drivers mesa-va-drivers-freeworld


# These drivers contains video acceleration codecs for decoding/encoding
# H.264 and H.265algorithms and decoding only VC1 algorithm.
# Mesa-based VDPAU drivers.
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sudo dnf swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld

