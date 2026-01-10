{ ... }:
{
  home.stateVersion = "24.11";
  imports = [
    ./editor/neovim.nix
    ./features.nix
    ./gui
    ./shell
    ./style
    ./tools
    ./vcs/git.nix
  ];
}
