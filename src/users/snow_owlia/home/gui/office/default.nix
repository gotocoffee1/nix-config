{ pkgs, ... }:
{
  imports = [
    ./firefox.nix
    ./keepassxc.nix
    ./thunderbird.nix
  ];
  home.packages = with pkgs; [
    libreoffice
  ];
}
