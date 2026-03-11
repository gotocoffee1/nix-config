{ config, pkgs, ... }:
{
  stylix = import ./style.nix {
    fonts = config.envFeatures.fonts;
    inherit pkgs;
  };
  i18n.defaultLocale = "de_DE.UTF-8";
}
