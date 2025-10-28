{ config, ... }:
let
  gui = config.homeFeatures.gui;
in
{
  programs.thunderbird = {
    enable = gui.enable;
    settings = {
    };
    profiles.main = {
      isDefault = true;
    };
  };
}
