{ profile, features, ... }:
{ lib, config, ... }:
let
  isDesktop = profile == "desktop";
  isServer = profile == "server";
in
{
  imports = [
  ]
  ++ lib.optionals (isDesktop || profile == "devel") [
    #./tools
    #./vcs
  ]
  ++ lib.optionals isServer [
    #./tools/btop.nix
  ]
  ++ lib.optionals isDesktop [
    #./gui
  ];
}
