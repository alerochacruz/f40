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
PS1='${PROMPT_START@P}'"${colorpre}"'${PROMPT_COLOR}'"${colorsuf}"'${PROMPT_USERHOST@P}'"${colorreset}"'${PROMPT_SEPARATOR@P}'"${colorpre}"'${PROMPT_DIR_COLOR:-${PROMPT_COLOR}}'"${colorsuf}"'${PROMPT_DIRECTORY@P}'"${colorreset}"'${PROMPT_END@P}\n\$'"${colorreset} "
EOF

