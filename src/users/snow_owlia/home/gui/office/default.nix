{ pkgs, ... }:
{
  imports = [
    ./firefox.nix
    ./keepassxc.nix
    #./thunderbird.nix
  ];
  home.packages = with pkgs; [
    libreoffice
  ];
  # https://github.com/nix-community/home-manager/issues/6188
  gtk.gtk2.force = true;
}
