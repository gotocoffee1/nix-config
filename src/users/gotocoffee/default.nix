{ lib, config, ... }:
let
  features = config.envFeatures;
in
{

  users.users.gotocoffee = {
    extraGroups = [
      "networkmanager"
    ];
    openssh.authorizedKeys.keyFiles = lib.optional features.ssh.enable ./home/keys/id_ed25519.pub;
  };
}
