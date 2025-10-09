{ config, ... }:
let
  gui = config.homeFeatures.gui;
in
{
  programs.thunderbird = {
    enable = gui.enable;
    profiles.main = {
      isDefault = true;
    };
  };
}
