{ pkgs, fonts, ... }:
{
  enable = true;
  overlays.enable = false; # #1832
  polarity = "light";
  base16Scheme = "${pkgs.base16-schemes}/share/themes/sakura.yaml";
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
}
