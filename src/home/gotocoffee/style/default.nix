{ pkgs, config, ... }:
let
  fonts = config.homeFeatures.fonts;
in
{
  stylix = {
    enable = true;
    overlays.enable = false; # #1832
    polarity = "dark";
    #image = ../gui/wallpaper/minimal/simple-sharing-v0-27d3vwajcadd1.webp;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark.yaml";
    iconTheme = {
      enable = true;
      package = pkgs.gruvbox-plus-icons;
      light = "Gruvbox-Plus-Light";
      dark = "Gruvbox-Plus-Dark";
    };
    fonts = {
      monospace = fonts.mono;
      serif = fonts.serif;
      sansSerif = fonts.sans;
      emoji = fonts.emoji;
      sizes = {
        popups = 12;
        desktop = 12;
        terminal = 12;
      };
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
      starship.enable = false;
      qt.enable = true;
      firefox.profileNames = [ "default" ];
    };
  };
}
