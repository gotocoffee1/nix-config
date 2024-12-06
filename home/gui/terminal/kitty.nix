{pkgs, ...}:
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    font = {
      name = "FiraCode Nerd Font";
      package = pkgs.fira-code-nerdfont;
    };
    themeFile = "gruvbox-dark";
    settings = {
      background_opacity = "0.7";
    };
    extraConfig = 
      "mouse_map middle release ungrabbed";
  };
}
