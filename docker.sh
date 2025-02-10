#!/usr/bin/env bash

set -e
set -u
set -o pipefail
set -x
shopt -s failglob


# Mon 10 Feb 2025
# Known Issue: Docker breaks KVM bridge networking, complicating simultaneous use.
# Reference: https://wiki.archlinux.org/title/Docker#Starting_Docker_breaks_KVM_bridged_networking

# Workaround: Save default iptables configuration to restore when using KVM
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
mkdir --parents --verbose ~/.factory-settings 
sudo iptables-save > ~/.factory-settings/iptables.backup

# To switch to using KVM:
# 1. Stop the Docker service
# sudo systemctl stop docker

# 2. Restore the iptables configuration from the backup to reset the network settings
# sudo iptables-restore < ~/.factory-settings/iptables.backup


# Install Docker using the rpm repository
# Reference: https://docs.docker.com/engine/install/fedora/
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# dnf-plugins-core provides the commands to manage your DNF repositories
sudo dnf install --assumeyes \
  dnf-plugins-core

# Set up the repository with dnf-3 (in DNF5, the --add-repo option does not exist yet)
sudo dnf-3 config-manager --add-repo \
  https://download.docker.com/linux/fedora/docker-ce.repo

# Install the Docker engine packages
sudo dnf --no-gpgchecks install --assumeyes \
  docker-ce \
  docker-ce-cli \
  containerd.io \
  docker-buildx-plugin \
  docker-compose-plugin

# Post-installation steps:
# To enable the Docker systemd service to start automatically at system boot:
# sudo systemctl enable --now docker

# Alternatively, to start the Docker service manually:
# sudo systemctl start docker

# To run Docker commands without sudo, add your user to the docker group:
# sudo usermod --append --groups docker $USER
# A system reboot is necessary for the changes to take effect.

# Verify that the installation is successful by running the hello-world image:
# docker run hello-world

