{ pkgs, lib, ... }:
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
    kb_layout = mkOption {
      type = types.str;
      default = "de";
    };
    users = mkOption {
      type = types.listOf types.str;
      default = [ ];
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
