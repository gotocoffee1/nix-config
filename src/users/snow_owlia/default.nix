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
