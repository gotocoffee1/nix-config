{ ... }:
{
  home.stateVersion = "25.11";
  imports = [
    ./features.nix
    ./style
  ];
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
}
