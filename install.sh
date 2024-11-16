#!/bin/sh

nix-shell -p git
git clone https://github.com/gotocoffee1/nix-config.git
sudo ln -f -s "$PWD/nix-config/configuration.nix" "/etc/nixos/configuration.nix"
sudo nixos-rebuild switch
exit
