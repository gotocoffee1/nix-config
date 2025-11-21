{
  pkgs,
  config,
  ...
}:
let
  gui = config.homeFeatures.gui;
  gaming = gui.gaming;
in
{
  home.packages = with pkgs; [ ] ++ lib.optional (gui.enable && gaming.enable) discord;
}
