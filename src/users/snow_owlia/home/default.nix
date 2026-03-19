{ profile, ... }:
{ lib, ... }:
let
  isDesktop = profile == "desktop";
in
{
  home.stateVersion = "25.11";
  imports = [
    ./features.nix
    ./style
  ]
  ++ lib.optionals (isDesktop) [
    ./shell
    ./gui
  ];
  home.file.".face".source = ./face.png;
  xdg.userDirs = lib.mkIf isDesktop {
    enable = true;
    createDirectories = true;
  };

  home.language =
    let
      locale = "de_DE.UTF-8";
    in
    {
      base = locale;
      ctype = locale;
      numeric = locale;
      time = locale;
      collate = locale;
      monetary = locale;
      messages = locale;
      paper = locale;
      name = locale;
      address = locale;
      telephone = locale;
      measurement = locale;
    };
}
