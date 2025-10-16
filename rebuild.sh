#!/bin/sh
set -e
script_dir=$(realpath $(dirname $0))

host=${1:-vm}
specialisation=${2:+--specialisation $2}

sudo nixos-rebuild --impure --flake .#$host switch $specialisation

