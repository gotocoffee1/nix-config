{ ... }:
{
  home.stateVersion = "25.11";
  imports = [
    ./features.nix
    ./gui
    ./style
  ];
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
}
