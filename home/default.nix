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
  homeFeatures = {
    gui = {
      enable = true;
      vnc = { enable = true; };
    };
  };
}

