{ lib, osConfig, ... }:
with lib;
{
  options.homeFeatures = {
    gui = {
      enable = mkEnableOption "Enable GUI" // { default = true; };
      vnc = {
        enable = mkEnableOption "Enable VNC";
      };
    };
  };
}

