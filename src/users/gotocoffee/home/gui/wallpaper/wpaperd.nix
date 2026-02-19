{ config, ... }:
let
  gui = config.homeFeatures.gui;
in
{
  services.wpaperd = {
    enable = gui.enable;
    settings = {
      default = {
        path = ./. + "/minimal";
        duration = "3m";
      };
    };
  };
}
