{ config, ... }:
let
  gui = config.homeFeatures.gui;
in
{
  programs.kitty = {
    enable = gui.enable;
    settings = { };
    extraConfig =
      "mouse_map middle release ungrabbed";
  };
}
