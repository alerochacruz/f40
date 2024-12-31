#!/usr/bin/env bash

set -e
set -u
set -o pipefail
#set -x
shopt -s failglob


# Retrieve .env values
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
source .env


# Setup Git username, commit email address and the default text editor
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
git config --list
git config --global user.name "$GIT_USER_NAME"
git config --global user.email "$GIT_USER_EMAIL"
git config --global core.editor "$GIT_CORE_EDITOR"
git config --list


# Generate new ssh key pairs
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ssh-keygen -q -t ed25519 -C "$SSH_KEYGEN_COMMENT" -N "$SSH_KEYGEN_PASSPHRASE" -f ~/.ssh/id_ed25519


# Copy public ssh key to the clipboard.
# Paste on: GitHub > Settings > SSH and GPG keys
# https://github.com/settings/keys
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
xclip -sel clip < ~/.ssh/id_ed25519.pub
