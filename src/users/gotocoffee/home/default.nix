{ ... }:
{
  home.stateVersion = "25.11";
  imports = [
    ./editor
    ./features.nix
    ./gui
    ./music
    ./shell
    ./style
    ./tools
    ./vcs
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
