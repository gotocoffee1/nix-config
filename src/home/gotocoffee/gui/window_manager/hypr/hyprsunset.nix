{ config, ... }:
let
  gui = config.homeFeatures.gui;
in
{
  services.hyprsunset = {
    enable = gui.enable;

  };
}
