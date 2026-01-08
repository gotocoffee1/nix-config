#!/bin/sh

set -e

nix-shell -p git --run "git clone --recurse-submodules git@github.com:gotocoffee1/nix-config.git"
cd "$PWD/nix-config"
"./src/extra/install.sh"
"./rebuild.sh"

