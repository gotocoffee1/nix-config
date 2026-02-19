{ pkgs, config, ... }:
{
  stylix = {
    #image = ../gui/wallpaper/minimal/simple-sharing-v0-27d3vwajcadd1.webp;
    iconTheme = {
      enable = true;
      package = pkgs.gruvbox-plus-icons;
      light = "Gruvbox-Plus-Light";
      dark = "Gruvbox-Plus-Dark";
    };
    opacity = {
      terminal = 0.7;
      popups = 0.8;
    };
    cursor = {
      name = "phinger-cursors-dark";
      package = pkgs.phinger-cursors;
      size = 16;
    };
    targets = {
      neovim.enable = false;
      nixvim.enable = false;
      starship.enable = false;
      qt.enable = true;
      firefox.profileNames = [ "default" ];
    };
  }
  // import ../../style.nix {
    fonts = config.homeFeatures.fonts;
    inherit pkgs;
  };
}
