#!/usr/bin/env bash

set -e
set -u
set -o pipefail
set -x
shopt -s failglob


# Remove Gnome Boxes
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sudo dnf remove --assumeyes \
  gnome-boxes


# dnf group info virtualization
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# Id                   : virtualization
# Name                 : Virtualization
# Description          : These packages provide a graphical virtualization environment.
# Mandatory packages   : virt-install
# Default packages     : libvirt-daemon-config-network
#                      : libvirt-daemon-kvm
#                      : qemu-kvm
#                      : virt-manager
#                      : virt-viewer
# Optional packages    : guestfs-tools
#                      : python3-libguestfs
#                      : virt-top


# Install virtualization packages
# Reference: https://docs.fedoraproject.org/en-US/quick-docs/virtualization-getting-started/
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sudo dnf group install --assumeyes \
  virtualization


# Configure virt-manager to use a dark GTK theme
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sudo sed --in-place \
  's/Exec=virt-manager/Exec=env GTK_THEME=HighContrastInverse virt-manager/' \
  /usr/share/applications/virt-manager.desktop


# Post-installation steps:
# To prevent virt-manager from prompting for a sudo password, add your user to the libvirt group:
# sudo usermod --append --groups libvirt $USER
# A system reboot is necessary for the changes to take effect.

