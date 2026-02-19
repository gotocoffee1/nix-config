{ ... }:
{
  programs.zellij = {
    enable = true;
    enableFishIntegration = true;
  };
  #https://github.com/NixOS/nixpkgs/issues/198655
  xdg.configFile."zellij" = {
    source = ./zellij;
    recursive = true;
  };
}

