#!/bin/sh
set -e
script_dir=$(realpath $(dirname $0))

sudo nixos-rebuild -I nixos-config="$script_dir/src/configuration.nix" switch

