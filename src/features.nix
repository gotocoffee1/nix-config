{ pkgs, lib, ... }:
with lib;
{
  options.envFeatures = {
    gui = {
      enable = mkEnableOption "Enable GUI";
      gaming = {
        enable = mkEnableOption "Enable Gaming";
      };
    };
    ssh = {
      enable = mkEnableOption "Enable SSH";
    };
    hardware = {
      isVirtual = mkEnableOption "Is virtual enviroment";
      hasBattery = mkEnableOption "Device has battery";
      kbLayout = mkOption {
        type = types.str;
        default = "de";
      };
    };
    fonts =
      let
        mkFont = name: package: {
          name = mkOption {
            type = types.str;
            default = name;
          };
          package = mkOption {
            type = types.package;
            default = package;
          };
        };
      in
      {
        serif = mkFont "DejaVu Serif" pkgs.dejavu_fonts;
        sans = mkFont "DejaVu Sans" pkgs.dejavu_fonts;
        mono = mkFont "FiraCode Nerd Font" pkgs.nerd-fonts.fira-code;
        emoji = mkFont "Noto Color Emoji" pkgs.noto-fonts-color-emoji;
      };
  };
}
