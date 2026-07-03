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
  home.language =
    let
      locale = "de_DE.UTF-8";
    in
    {
      address = locale;
      base = "en_US.UTF-8";
      #collate = locale;
      #ctype = locale;
      measurement = locale;
      #messages = locale;
      monetary = locale;
      name = locale;
      numeric = locale;
      paper = locale;
      telephone = locale;
      time = locale;
    };
}
