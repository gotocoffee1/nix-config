{
  pkgs,
  config,
  lib,
  ...
}:
{
  imports = [
    # <nixpkgs/nixos/modules/installer/sd-card/sd-image-aarch64.nix>
    ./pi-hole.nix
    ./nas.nix
    ../../core.nix
  ];

  #sdImage = {
  #  compressImage = false;
  #  imageName = "nixos-sd-image-my-cool-rpi.img";
  #};

  networking.hostName = "coffee-server";

  system.stateVersion = "25.11";
  # nixpkgs.hostPlatform = "aarch64-linux";
  nixpkgs.hostPlatform = "x86_64-linux";

}
