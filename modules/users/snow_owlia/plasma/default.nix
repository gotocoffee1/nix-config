{
  so.plasma = {
    homeManager = {
      home.file.".face".source = ./face.png;
    };
    nixos = {
      services = {
        desktopManager.plasma6.enable = true;
      };
    };
  };
}
