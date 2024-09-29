#!/usr/bin/env bash

set -e
set -u
set -o pipefail
set -x
shopt -s failglob

# Commands
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# List themes: lp_theme --list
# Use theme: lp_theme <theme_name>


# 1. Clone Liquid Prompt
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
git clone https://github.com/nojhan/liquidprompt.git /tmp/liquidprompt


# 2. Move the main executable to ~/Applications directory
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
mkdir --parents ~/Applications
mv --verbose /tmp/liquidprompt/liquidprompt ~/Applications


# 3. Set up ~/.liquidpromtrc configuration file
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
cat << "EOF" > ~/.liquidpromptrc
LP_ENABLE_SHLVL=0
EOF


# 4. Set up Pureship theme
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
git clone https://github.com/nojhan/lp-pureship.git /tmp/lp-pureship
mkdir --parents ~/.config/liquidprompt/themes/pureship
mv --verbose /tmp/lp-pureship/starship.theme ~/.config/liquidprompt/themes/pureship


# 5. Set up ~/.bashrc
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
cat << "EOF" >> ~/.bashrc

# Only load Liquidprompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source /home/alejandro/Applications/liquidprompt 
source /home/alejandro/.config/liquidprompt/themes/pureship/starship.theme

lp_theme starship
EOF

