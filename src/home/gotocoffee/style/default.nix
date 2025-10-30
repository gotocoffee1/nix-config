{ pkgs, ... }:
{
  stylix = {
    enable = true;
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
      monospace = {
        name = "FiraCode Nerd Font";
        package = pkgs.nerd-fonts.fira-code;
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
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
