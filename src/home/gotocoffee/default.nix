{ ... }:
{
  home.stateVersion = "24.11";
  imports = [
    ./features.nix
    ./editor/neovim.nix
    ./gui
    ./shell
    ./style
    ./tools
    ./vcs/git.nix
  ];
}

