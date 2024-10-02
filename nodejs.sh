#!/usr/bin/env bash

set -e
set -u
set -o pipefail
set -x
shopt -s failglob


# 1. Retrieve the latest version of nvm
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
latest_nvm=$(curl -sL https://api.github.com/repos/nvm-sh/nvm/releases/latest | jq -r ".tag_name")


# 2. Download in install the latest version of nvm
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
cd $HOME
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/"${latest_nvm}"/install.sh | bash

source $HOME/.nvm/nvm.sh

nvm install node
nvm use node

