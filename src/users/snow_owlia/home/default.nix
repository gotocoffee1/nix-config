{ ... }:
{
  home.stateVersion = "25.11";
  imports = [
    ./features.nix
    ./gui
    ./style
  ];
  xdg.userDirs = {
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
