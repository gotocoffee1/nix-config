{
  gtc.shell.homeManager = {
    programs.zellij = {
      enable = true;
      enableFishIntegration = true;
    };
    #https://github.com/NixOS/nixpkgs/issues/198655
    xdg.configFile."zellij/config.kdl" = {
      source = ./config.kdl;
    };
  };
}
