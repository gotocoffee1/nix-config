{ config, ... }:
let
  gui = config.homeFeatures.gui;
in
{
  programs.wpaperd = {
    enable = gui.enable;
    settings = {
      default = {
        path = ./. + "/minimal";
        duration = "3m";
      };
    };
  };
}
