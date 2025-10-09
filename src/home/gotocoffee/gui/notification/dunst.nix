{ config, ... }:
let
  gui = config.homeFeatures.gui;
in
{
  services.dunst = {
    enable = gui.enable;
    settings = { };
  };
}
