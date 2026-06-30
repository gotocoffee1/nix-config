{ isMainUser, profile, ... }:
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
    uid = 1000;
    extraGroups = [
      "networkmanager"
    ]
    ++ lib.optional isMainUser "wheel";

    openssh.authorizedKeys.keyFiles = lib.optional features.ssh.enable ./keys/id_ed25519.pub;
  };

  programs = {
    steam.enable = features.gui.enable && features.gui.gaming.enable;
  };
  # Select internationalisation properties.
  i18n.extraLocales = [
    "de_DE.UTF-8/UTF-8"
    "en_US.UTF-8/UTF-8"
  ];
  # for discord

  services.flatpak.enable = features.gui.enable && features.gui.gaming.enable;

  xdg = lib.mkIf (features.gui.enable && features.gui.gaming.enable) {
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
      ];
    };
  };
}
