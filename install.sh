#!/bin/sh

nix-shell -p git --run "git clone https://github.com/gotocoffee1/nix-config.git"
"$PWD/nix-config/rebuild.sh"

