#!/usr/bin/env bash

set -e
set -u
set -o pipefail
set -x
shopt -s failglob


# 1. Install fonts
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sudo dnf install --assumeyes \
  rsms-inter-fonts \
  google-roboto-fonts


# 2. Create fontconfig directory
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
mkdir --parents ~/.config/fontconfig/


# 3. Add font aliases
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
cat << "EOF" >> ~/.config/fontconfig/fonts.conf
<?xml version='1.0'?>
<!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
<fontconfig>
  <alias>
    <family>sans-serif</family>
    <prefer><family>Inter</family></prefer>
  </alias>
  <alias>
    <family>monospace</family>
    <prefer><family>Liberation Mono</family></prefer>
  </alias>
  <match>
    <test name="family"><string>Arial</string></test>
    <edit name="family" mode="assign" binding="strong">
      <string>Inter</string>
    </edit>
  </match>
  <match>
    <test name="family"><string>Noto Sans</string></test>
    <edit name="family" mode="assign" binding="strong">
      <string>Inter</string>
    </edit>
  </match>
  <match>
    <test name="family"><string>Nimbus Sans L</string></test>
    <edit name="family" mode="assign" binding="strong">
      <string>Inter</string>
    </edit>
  </match>
</fontconfig>
EOF

