{ config, pkgs, ... }:
{
  stylix = import ./style.nix {
    fonts = config.envFeatures.fonts;
    inherit pkgs;
  };
}
