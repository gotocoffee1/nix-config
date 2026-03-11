{
  pkgs,
  lib,
  config,
  ...
}:
let
  features = config.envFeatures;
in
{
  users.users.gotocoffee = {
    shell = pkgs.fish;
    extraGroups = [
      "networkmanager"
    ];
    openssh.authorizedKeys.keyFiles = lib.optional features.ssh.enable ./keys/id_ed25519.pub;
  };
  programs = {
    hyprland.enable = features.gui.enable;
    steam.enable = features.gui.enable && features.gui.gaming.enable;
    fish.enable = true;
  };
  # Select internationalisation properties.
  i18n.extraLocales = [
    "de_DE.UTF-8/UTF-8"
    "en_US.UTF-8/UTF-8"
  ];
}
