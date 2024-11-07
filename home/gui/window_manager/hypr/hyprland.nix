{pkgs, ...}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "Super";
      input = {
        kb_layout = "de";
        numlock_by_default = true;
        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
          clickfinger_behavior = true;
        };
      };
      bind = [
        "$mod, T, exec, kitty"
        "$mod, F, exec, firefox"
        "$mod, C, killactive"
        "$mod, SUPER_L, exec, fuzzel"
      ];
      exec-once = [
        "waybar"
      ];
      misc = {
        middle_click_paste = false;
      };
      general = {
        # Gaps and border
        gaps_in = 4;
        gaps_out = 5;
        gaps_workspaces = 50;
        border_size = 1;
      };
      decoration = {
        rounding = 12;
      };
    };
  };
}

