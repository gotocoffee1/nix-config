{
  pkgs,
  ...
}:
{
  imports = [
    ./pi-hole.nix
    ./nas.nix
    ../../core.nix
    ../../specialisations/headless.nix
    ./hardware-configuration.nix
  ];

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
