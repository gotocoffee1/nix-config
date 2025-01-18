{ ... }:
{
  home.stateVersion = "24.11";
  imports = [
    ./features.nix
    ./editor/neovim.nix
    ./gui
    ./shell
    ./stylix.nix
    ./tools/direnv.nix
    ./tools/btop.nix
    ./vcs/git.nix
  ];
  homeFlavor = {
    gui = {
      enable = true;
    };
  };
}

