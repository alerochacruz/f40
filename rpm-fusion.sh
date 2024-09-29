#!/usr/bin/env bash

set -e
set -u
set -o pipefail
set -x
shopt -s failglob


# 0. Update packages to their latest versions
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sudo dnf update --assumeyes


# 1. Enable RPM fusion repositories
# RPM Fusion provides software that the Fedora Project or Red Hat doesn't want
# to ship. That software is provided as precompiled RPMs for all current Fedora
# versions and current Red Hat Enterprise Linux or clones versions
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

sudo dnf install --assumeyes \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install --assumeyes \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm


# 2. Switch to full ffmpeg
# Fedora ffmpeg-free works most of the time, but one will experience version
# missmatch from time to time. Switch to the rpmfusion provided ffmpeg build
# that is better supported.
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sudo dnf swap --assumeyes --allowerasing ffmpeg-free ffmpeg


# 3. Install additional codecs
# This will allows the application using the gstreamer framework and other
# multimedia software, to play others restricted codecs:
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# The following command will install the complements multimedia packages needed
# by gstreamer enabled applications:
sudo dnf update --assumeyes @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin


# 4. Install sound-and-video commplement
# The following command will install the sound-and-video complement packages
# needed by some applications:
sudo dnf group install --assumeyes "Sound and Video"
sudo dnf update --assumeyes @sound-and-video 

