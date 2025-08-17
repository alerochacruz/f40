#!/usr/bin/env bash

set -e
set -u
set -o pipefail
set -x
shopt -s failglob


# Exclude 'vagrant' package from 'fedora' default repository to avoid conflicts
# Reference: https://discussion.fedoraproject.org/t/vagrant-and-fedora-36-beta/71117
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sudo sed --in-place \
  '/^\[fedora\]/a exclude=vagrant*' \
  /etc/yum.repos.d/fedora.repo

sudo sed --in-place \
  '/^\[fedora\]/a exclude=vagrant*' \
  /etc/yum.repos.d/fedora-updates.repo


# Install Vagrant from 'hashicorp' repository
# Reference: https://developer.hashicorp.com/vagrant/downloads
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sudo dnf install --assumeyes \
  dnf-plugins-core

sudo dnf config-manager addrepo \
  --from-repofile=https://rpm.releases.hashicorp.com/fedora/hashicorp.repo

sudo dnf install --assumeyes \
  vagrant


# Set VirtualBox as the default Vagrant provider
# Reference:
#   https://developer.fedoraproject.org/tools/vagrant/vagrant-virtualbox.html
#   https://developer.hashicorp.com/vagrant/docs/providers/default
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
cat << "EOF" >> ~/.bashrc

# Set VirtualBox as the default Vagrant provider
export VAGRANT_DEFAULT_PROVIDER=virtualbox
EOF

