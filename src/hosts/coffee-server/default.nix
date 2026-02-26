{
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./pi-hole.nix
    ./nas.nix
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
    supportedFilesystems = [ "zfs" ];
  };
  environment.systemPackages = with pkgs; [
    btop
  ];

  security.sudo.wheelNeedsPassword = false;

  networking.hostId = "fbde904b";
}
