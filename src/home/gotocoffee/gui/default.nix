{
  pkgs,
  lib,
  config,
  ...
}:
let
  gui = config.homeFeatures.gui;
in
{
  imports = [
    #./app_launcher/fuzzel.nix
    #./bar/waybar.nix
    #./cursor/cursor.nix
    ./caelestia
    ./gaming
    #./notification/dunst.nix
    ./office
    ./terminal/kitty.nix
    #./wallpaper/wpaperd.nix
    #./window_manager/sway/sway.nix
    ./window_manager/hypr
  ];

  xdg = lib.mkIf gui.enable {
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-termfilechooser
      ];
      config.hyprland = {
        default = [
          "hyprland"
          "gtk"
        ];
        "org.freedesktop.impl.portal.FileChooser" = "termfilechooser";
      };
    };
    configFile."xdg-desktop-portal-termfilechooser/config" = {
      force = true;
      text = ''
        [filechooser]
        cmd=${pkgs.xdg-desktop-portal-termfilechooser}/share/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh
      '';
    };
    terminal-exec = {
      enable = true;
      settings.default = [
        "kitty.desktop"
      ];
    };
  };
}
