#!/usr/bin/env bash

set -e
set -u
set -o pipefail
set -x
shopt -s failglob


# 1. Add MIME type for markdown files
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
cat << "EOF" >> ~/.mime.types
type=text/plain exts=md,mkd,mkdn,mdwn,mdown,markdown, desc="Markdown document"
EOF


# 2. Enable bash tab-completion for markdown files
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
sudo sed \
  --in-place \
  's/|pdf|txt|svg/|pdf|txt|md|svg/g' \
  /usr/share/bash-completion/completions/firefox

