{ pkgs, config, ... }:
let
  fonts = config.envFeatures.fonts;
in
{
  stylix = {
    enable = true;
    overlays.enable = false; # #1832
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark.yaml";
    fonts = {
      monospace = fonts.mono;
      serif = fonts.serif;
      sansSerif = fonts.sans;
      emoji = fonts.emoji;
      sizes = {
        popups = 12;
        desktop = 12;
        terminal = 12;
      };
    };
  };
}
