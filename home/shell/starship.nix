{config, ...}:
{
  programs.starship = {
    enable = true;
  };
  home.file."${config.xdg.configHome}/starship.toml".source = ./starship.toml;
}

