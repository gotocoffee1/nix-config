{ config, ... }:
let
  gui = config.homeFeatures.gui;
in
{
  programs.caelestia = {
    enable = gui.enable;
    systemd = {
      enable = false; # if you prefer starting from your compositor
      target = "graphical-session.target";
      environment = [ ];
    };
    settings = {
      paths = {
        wallpaperDir = ../wallpaper/minimal;
      };
      general = {
        apps = {
          terminal = [ "kitty" ];
          explorer = [ "caja" ];
        };
      };
      background = {
        desktopClock = {
          enabled = true;
        };
      };
      launcher = {

        showOnHover = true;
      };
      bar.status = {
        showBattery = false;
      };
    };
    cli = {
      enable = true; # Also add caelestia-cli to path
      settings = {
        theme = {
          enableGtk = false;
          enableTerm = false;
          enableFuzzel = false;
          enableQt = false;
        };
      };
    };
  };
}
