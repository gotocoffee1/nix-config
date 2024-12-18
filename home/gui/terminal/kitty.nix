{pkgs, ...}:
{
  programs.kitty = {
    enable = true;
    # font = {
    #  name = "FiraCode Nerd Font";
    #  package = pkgs.fira-code-nerdfont;
    #};
    settings = {
      #  background_opacity = "0.7";
    };
    extraConfig = 
      "mouse_map middle release ungrabbed";
  };
}
