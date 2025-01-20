{ lib, ... }:
with lib;
{
  options.envFeatures = {
    gui = {
      enable = mkEnableOption "Enable GUI";
    };
    ssh = {
      enable = mkEnableOption "Enable SSH";
    };
    hardware = {
      isVirtual = mkEnableOption "Is virtual enviroment";
    };
  };
}

