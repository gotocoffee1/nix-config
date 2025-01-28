{ pkgs, ... }:
let
  stylix = builtins.fetchTarball "https://github.com/danth/stylix/archive/release-24.11.tar.gz";
in
{
  imports = [
    (import stylix).homeManagerModules.stylix
  ];
  stylix = {
    enable = true;
    polarity = "dark";
    image = ../gui/wallpaper/minimal/simple-sharing-v0-27d3vwajcadd1.webp;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";
    iconTheme = {
      enable = true;
      package = pkgs.kanagawa-icon-theme;
      dark = "Kanagawa";
    };
    fonts = {
      monospace = {
        name = "FiraCode Nerd Font";
        package = pkgs.fira-code-nerdfont;
      };
      #sansSerif
      #serif
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
    };
  };
}

