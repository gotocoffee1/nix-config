{
  pkgs,
  lib,
  ...
}:
let
  users = {
    gotocoffee = {
      profile = "server";
      isMainUser = true;
      enableExtra = false;
    };
    snow_owlia = {
      profile = "server";
      enableExtra = false;
    };
  };
in
{
  imports = [
    ./pi-hole.nix
    ./mealie.nix
    (import ./nas.nix (builtins.attrNames users))
    ../../core.nix
    ../../specialisations/headless.nix
    ./hardware-configuration.nix
  ]
  ++ [
    (import ../../users users)
  ];

  boot = {
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
  };

  security.sudo.wheelNeedsPassword = false;
}
