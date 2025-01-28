{ lib, osConfig, ... }:
with lib;
let
  hasEnv = osConfig ? envFeatures;
  env = osConfig.envFeatures;
in
{
  options.homeFeatures = {
    gui = {
      enable = mkEnableOption "Enable GUI" // optionalAttrs hasEnv { default = env.gui.enable; };
      vnc = {
        enable = mkEnableOption "Enable VNC" // optionalAttrs hasEnv { default = env.hardware.isVirtual; };
      };
    };
  };
}

