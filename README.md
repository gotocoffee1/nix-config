# Nix Config

This is my NixOS setup.

## Install

```bash
curl -s https://raw.githubusercontent.com/gotocoffee1/nix-config/refs/heads/main/install.sh | bash -s
```

## Useful commands

```bash
nmcli device wifi connect --ask
mkdir mnt
sudo mount /dev/sda1 mnt
cp mnt/key/* ~/.ssh/
chmod 400 ~/.ssh/
```

