{ lib, osConfig, ... }:
with lib;
let
  envFeatures = osConfig.envFeatures;
in
{
  options.homeFeatures = {
    gui = {
      enable = mkEnableOption "Enable GUI" // { default = envFeatures.gui.enable; };
      vnc = {
        enable = mkEnableOption "Enable VNC" // { default = envFeatures.hardware.isVirtual; };
      };
    };
  };
}

