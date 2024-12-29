#!/usr/bin/env bash

set -e
set -u
set -o pipefail
set -x
shopt -s failglob

# 1. Set up a two-line PS1 prompt
# Reference: /etc/profile.d/bash-color-prompt.sh:16
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
cat << "EOF" >> ~/.bashrc

# Two-line PS1 prompt
PS1='${PROMPT_START@P}\[\e[${PROMPT_COLOR}${PROMPT_HIGHLIGHT:+;${PROMPT_HIGHLIGHT}}m\]${PROMPT_USERHOST@P}\[\e[0m\]${PROMPT_SEPARATOR@P}\[\e[${PROMPT_DIR_COLOR-${PROMPT_COLOR}}${PROMPT_HIGHLIGHT:+;${PROMPT_HIGHLIGHT}}m\]${PROMPT_DIRECTORY@P}\[\e[0m\]${PROMPT_END@P}\n\$\[\e[0m\] '
EOF

