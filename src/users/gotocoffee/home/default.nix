{ config, lib, ... }:
{
  home.stateVersion = "24.11";
  imports = [
    ./editor
    ./features.nix
    ./gui
    ./music
    ./shell
    ./style
    ./tools
    ./vcs
  ];
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
}
