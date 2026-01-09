{ config, ... }:
let
  gui = config.homeFeatures.gui;
  fonts = config.homeFeatures.fonts;
in
{
  home.file.".face".source = ./face.png;
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
            clock = fonts.sans.name;
            mono = fonts.mono.name;
            sans = fonts.sans.name;
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
          terminal = [ gui.terminal ];
          explorer = [ gui.explorer ];
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
