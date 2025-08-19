#!/usr/bin/env bash

set -e
set -u
set -o pipefail
set -x
shopt -s failglob


# Install Pandoc and necessary LaTeX dependencies to
# generate a LaTeX-formatted PDF from Markdown
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sudo dnf install --assumeyes \
  pandoc \
  pandoc-pdf \
  texlive-mdwtools \
  texlive-tocloft \
  texlive-titling

