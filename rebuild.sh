#!/bin/sh
set -e
script_dir=$(realpath $(dirname $0))

host=${1:-vm}
specialisation=${2:+--specialisation $2}

sudo nixos-rebuild -I nixos-config="$script_dir/src/hosts/$host/configuration.nix" switch $specialisation

