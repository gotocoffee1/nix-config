{ config, ... }:
let
  gui = config.homeFeatures.gui;
in
{
  programs.kitty = {
    enable = gui.enable;
    settings = {
      cursor_trail = 1;
    };
    extraConfig = "mouse_map middle release ungrabbed";
  };
}
