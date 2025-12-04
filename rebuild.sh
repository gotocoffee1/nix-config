#!/bin/sh
set -e
script_dir=$(realpath $(dirname $0))

host=${1:-vm}
specialisation=${2:+--specialisation $2}

nixos-rebuild --sudo --impure --flake .#$host switch $specialisation

