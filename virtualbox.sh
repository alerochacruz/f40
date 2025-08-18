#!/usr/bin/env bash

set -e
set -u
set -o pipefail
set -x
shopt -s failglob


# Install VirtualBox from the RPM Fusion repository
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sudo dnf install --assumeyes \
  virtualbox


# VirtualBox Guest Additions
# These are meant to be installed inside a virtual machine (not on the host).
# Reference: https://packages.fedoraproject.org/pkgs/virtualbox-guest-additions/virtualbox-guest-additions/
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# sudo dnf install --assumeyes \
#   virtualbox-guest-additions


# Download the VirtualBox Extension Pack
# The Extension Pack version must match the installed VirtualBox version.
# Reference:
#   https://docs.oracle.com/en/virtualization/virtualbox/6.0/user/intro-installing.html
#   https://forums.virtualbox.org/viewtopic.php?t=109254
#   https://download.virtualbox.org/virtualbox/
# Installation (VirtualBox GUI):
#   File > Tools > Extension Pack Manager > Install Extension Pack
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
curl \
  --location \
  --remote-name \
  --output-dir ~/Downloads \
  https://download.virtualbox.org/virtualbox/7.1.12/Oracle_VirtualBox_Extension_Pack-7.1.12-169651.vbox-extpack


# Post-installation steps
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# 1. Add your user to the "vboxusers" group:
#    sudo usermod --append --groups vboxusers $USER
#
#    Explanation: VirtualBox requires membership in the "vboxusers" group
#    to allow access to certain host resources from virtual machines.
#    Examples:
#      - USB device passthrough
#      - Shared folders between host and guest
#      - Some networking features
#
#    Without being in this group, these features will not work for your user.
#
# 2. Reboot the system for the group change to take effect.

