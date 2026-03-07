{ ... }:
{
  home.stateVersion = "25.11";
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
