{ profile, features, ... }:
{ lib, config, ... }:
let
  isDesktop = profile == "desktop";
  isServer = profile == "server";
in
{
  imports = [
    (import ./features.nix features)
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
  xdg.userDirs = lib.mkIf isDesktop {
    enable = true;
    createDirectories = true;
  };
}
