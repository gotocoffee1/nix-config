{pkgs, ...}:
{
  programs.zellij = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      ui = {
        pane_frames = {
          rounded_corners = true;
          hide_session_name = true;
        };
      };
    };
  };
}

