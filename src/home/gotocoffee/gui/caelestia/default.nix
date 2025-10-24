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
      appearance = {
        font = {
          family = {
            clock = gui.fonts.sans.name;
            mono = gui.fonts.mono.name;
            sans = gui.fonts.sans.name;
          };
        };
        transparency = {
          enabled = true;
        };
      };
      paths = {
        wallpaperDir = ../wallpaper/minimal;
        sessionGif = ./session.gif;
        mediaGif = ./media.gif;
      };
      general = {
        apps = {
          terminal = [ "${gui.terminal}" ];
          explorer = [ "dolphin" ];
        };
      };
      background = {
        desktopClock = {
          enabled = true;
        };
      };
      border = {
        rounding = gui.rounding;
        thickness = gui.border;
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
          enableFuzzel = true;
          enableQt = false;
        };
      };
    };
  };
}
