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
      rounding = mkOption {
        type = types.ints.unsigned;
        default = 12;
      };
      border = mkOption {
        type = types.ints.unsigned;
        default = 2;
      };
      fonts = {
        sans = {
          name = mkOption {
            type = types.str;
            default = "DejaVu Sans";
          };
        };
        mono = {
          name = mkOption {
            type = types.str;
            default = "FiraCode Nerd Font";
          };
        };
      };
    };
  };
}
