{ lib, ... }:
with lib;
{
  options.homeFlavor = {
    gui = {
      enable = mkEnableOption "Enable GUI";
      vnc = {
        enable = mkEnableOption "Enable VNC";
      };
    };
  };
}

