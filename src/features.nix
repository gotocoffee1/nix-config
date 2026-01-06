{ lib, ... }:
with lib;
{
  options.envFeatures = {
    gui = {
      enable = mkEnableOption "Enable GUI";
      monitor = mkOption {
        type = types.listOf types.str;
        default = [ ];
      };
      gaming = {
        enable = mkEnableOption "Enable Gaming";
      };
    };
    ssh = {
      enable = mkEnableOption "Enable SSH";
    };
    hardware = {
      isVirtual = mkEnableOption "Is virtual enviroment";
    };
  };
}
