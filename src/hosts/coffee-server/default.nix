{
  lib,
  ...
}:
{
  imports = [
    ./pi-hole.nix
    ./nas.nix
    ../../core.nix
    ./hardware-configuration.nix
  ];
  envFeatures = lib.mkDefault {
    ssh.enable = true;
  };
  boot = {
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
  };

  security.sudo.wheelNeedsPassword = false;

  networking.hostName = "coffee-server";

  system.stateVersion = "25.11";
}
