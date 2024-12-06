{pkgs, ...}:
{
  wayland.windowManager.sway = {
    enable = true;
    config = {
        terminal = "kitty";
    };
  };
}

