{ config, ... }:
let
  gui = config.homeFeatures.gui;
in
{
  programs.fuzzel = {
    enable = gui.enable;
    settings = {
      main = {
        prompt = "\"󱞩 \"";
        exit-on-keyboard-focus-loss = true;
      };
    };
  };
}
