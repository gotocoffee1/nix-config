{ profile, ... }:
{ lib, ... }:
let
  isDesktop = profile == "desktop";
  isServer = profile == "server";
in
{
  home.stateVersion = "25.11";
  imports = [
    ./features.nix
    ./style
  ]
  ++ lib.optionals (isDesktop || profile == "devel") [
    ./editor
    ./shell
    ./tools
    ./vcs
  ]
  ++ lib.optionals isServer [
    ./tools/btop.nix
  ]
  ++ lib.optionals isDesktop [
    ./gui
    ./music
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
