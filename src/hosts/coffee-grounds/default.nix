{ lib, ... }:
let
  users = {
    gotocoffee = {
      profile = "server";
      isMainUser = true;
      enableExtra = false;
    };
  };
in
{
  imports = [
    ../../core.nix
    ../../specialisations/headless.nix
  ]
  ++ [
    (import ../../users users)
  ];
  security.sudo.wheelNeedsPassword = false;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
