#!/usr/bin/env bash

set -e
set -u
set -o pipefail
set -x
shopt -s failglob


# Install Vagrant from 'fedora' default repository
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sudo dnf install --assumeyes \
  vagrant


# Install the vagrant-libvirt package to use Vagrant with libvirt
# Reference:
#   https://developer.fedoraproject.org/tools/vagrant/vagrant-libvirt.html
#   https://fedoraproject.org/wiki/Vagrant
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sudo dnf install --assumeyes \
  vagrant-libvirt


# Set libvirt as the default Vagrant provider
# Reference:
#   https://developer.fedoraproject.org/tools/vagrant/vagrant-virtualbox.html
#   https://developer.hashicorp.com/vagrant/docs/providers/default
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
cat << "EOF" >> ~/.bashrc

# Set libvirt as the default Vagrant provider
export VAGRANT_DEFAULT_PROVIDER=libvirt
EOF

