{ lib, ... }:
with lib;
{
  options.homeFeatures = {
    gui = {
      enable = mkEnableOption "Enable GUI";
      vnc = {
        enable = mkEnableOption "Enable VNC";
      };
    };
  };
}

