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
      monitor = mkOption {
        type = types.listOf types.str;
        default = optionals hasEnv env.gui.monitor;
      };
      vnc = {
        enable = mkEnableOption "Enable VNC" // optionalAttrs hasEnv { default = env.hardware.isVirtual; };
      };
      gaming = {
        enable =
          mkEnableOption "Enable Gaming" // optionalAttrs hasEnv { default = env.gui.gaming.enable; };
      };
      rounding = mkOption {
        type = types.ints.unsigned;
        default = 12;
      };
      terminal = mkOption {
        type = types.str;
        default = "kitty";
      };
      explorer = mkOption {
        type = types.str;
        default = "dolphin";
      };
      border = mkOption {
        type = types.ints.unsigned;
        default = 2;
      };
    };
    kb_layout = mkOption {
      type = types.str;
      default = if hasEnv then env.kb_layout else "de";
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
