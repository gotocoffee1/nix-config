{...}:
{
  home.stateVersion = "24.11";
  imports = [
    ./editor/neovim.nix
    ./gui
    ./shell
    ./stylix.nix
    ./tools/direnv.nix
    ./tools/btop.nix
    ./vcs/git.nix
  ];
}

