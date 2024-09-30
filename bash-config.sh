#!/usr/bin/env bash

set -e
set -u
set -o pipefail
set -x
shopt -s failglob


# 0. Make ~/.bashrc backup
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
cp ~/.bashrc --verbose ~/bashrc.backup


# 1. Readline vi editing mode 
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
cat << "EOF" >> ~/.bashrc
 
# Readline vi editing mode
set -o vi
bind -m vi-insert 'Control-l: clear-screen'
EOF


# 2. Case-insensitive tab-completion
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
cat << "EOF" >> ~/.inputrc
$include /etc/inputrc

# Case-insensitive Tab-completion
set completion-ignore-case on
EOF


# 3. Advance tab-completion
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
cat << "EOF" >> ~/.inputrc

# Advance Tab-completion
set show-all-if-ambiguous on
set show-all-if-unmodified on
set menu-complete-display-prefix on
"\t": menu-complete
"\e[Z": menu-complete-backward
EOF


# 4. Bracketed paste mode
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
cat << "EOF" >> ~/.inputrc

# Bracketed Paste Mode
set enable-bracketed-paste
EOF

