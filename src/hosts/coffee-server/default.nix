{
  pkgs,
  ...
}:
{
  imports = [
    ./pi-hole.nix
    ./nas.nix
    ./hardware-configuration.nix
    ../../specialisations/headless.nix
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
