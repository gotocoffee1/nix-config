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
}
