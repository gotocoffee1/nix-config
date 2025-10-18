{ config, ... }:
let
  gui = config.homeFeatures.gui;
in
{
  programs.keepassxc = {
    enable = gui.enable;
  };
}
