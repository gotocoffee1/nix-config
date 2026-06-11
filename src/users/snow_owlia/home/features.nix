{
  pkgs,
  lib,
  osConfig,
  ...
}:
with lib;
let
  hasEnv = osConfig ? envFeatures;
  env = osConfig.envFeatures;
in
{
  options.homeFeatures = {
    gui = {
      enable = mkEnableOption "Enable GUI" // optionalAttrs hasEnv { default = env.gui.enable; };
      gaming = {
        enable =
          mkEnableOption "Enable Gaming" // optionalAttrs hasEnv { default = env.gui.gaming.enable; };
      };
    };
    hardware = {
      kbLayout = mkOption {
        type = types.str;
        default = if hasEnv then env.hardware.kbLayout else "de";
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
