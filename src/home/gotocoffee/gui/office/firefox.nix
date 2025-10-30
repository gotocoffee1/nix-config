{
  pkgs,
  inputs,
  config,
  ...
}:
let
  gui = config.homeFeatures.gui;
in
{
  programs.firefox = {
    enable = gui.enable;
    policies = {
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          private_browsing = true;
        };
      };
    };
    profiles.default = {
      isDefault = true;
      extensions = {
        packages = with inputs.firefox-addons.packages.${pkgs.system}; [
          ublock-origin
        ];
      };
      settings = {
        "extensions.autoDisableScopes" = 0;
        "extensions.update.autoUpdateDefault" = false;
        "extensions.update.enabled" = false;
      };
    };
  };
}
