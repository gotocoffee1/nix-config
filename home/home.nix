{...}:
{
  home.stateVersion = "24.11";
  imports = [
    ./editor/neovim.nix
    ./gui/gui.nix
    ./shell/fish.nix
    ./shell/zellij.nix
    #./shell/zsh.nix
    ./tools/direnv.nix
    ./tools/btop.nix
    ./vcs/git.nix
  ];
}

