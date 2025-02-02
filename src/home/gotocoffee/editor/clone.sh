#!/bin/sh

set -e
script_dir=$(realpath $(dirname $0))

git clone git@github.com:gotocoffee1/kickstart.nvim.git
ln -f -s "$PWD/kickstart.nvim" "$script_dir/nvim"

