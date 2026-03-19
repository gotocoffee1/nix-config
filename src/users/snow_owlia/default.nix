{ ... }:
{
  lib,
  config,
  ...
}:
let
  features = config.envFeatures;
in
{
  users.users.snow_owlia = {
    uid = 1001;
    extraGroups = [
      "networkmanager"
    ];
  };
  services = {
    desktopManager.plasma6.enable = features.gui.enable;
  };
  # Select internationalisation properties.
  i18n.extraLocales = [
    "de_DE.UTF-8/UTF-8"
  ];
}
