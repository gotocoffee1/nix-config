{ lib, ... }:
with lib;
{
  options.envFlavor = {
    gui = {
      enable = mkEnableOption "Enable GUI";
    };
    hardware = {
      isVirtual = mkEnableOption "Is virtual enviroment";
    };
  };
}

