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
    #./cursor/cursor.nix
    ./caelestia
    ./gaming
    ./office
    ./terminal/kitty.nix
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
