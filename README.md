# Nix Config

This is my NixOS setup.

## Install

```bash
git clone https://github.com/gotocoffee1/nix-config.git
sudo ln -f -s "$PWD/nix-config/configuration.nix" "/etc/nixos/configuration.nix"
sudo nixos-rebuild switch
```
