{pkgs, ...}:
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    font = {
      name = "FiraCode Nerd Font";
      package = pkgs.fira-code-nerdfont;
    };
    theme = "Earthsong";
    settings = {
      background_opacity = "0.7";
    };
  };
}
