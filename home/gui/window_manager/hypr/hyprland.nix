{pkgs, config, lib, ...}:
with lib;
let
  gui = config.home-config.gui;
  vnc = gui.vnc;
  isVirtual = true;
in
{
  home.packages = lib.optional (gui.enable && vnc.enable) pkgs.wayvnc;
  wayland.windowManager.hyprland = {
    enable = gui.enable;
    settings = {
      "$mod" = "Super";
      monitor = lib.optional isVirtual "Virtual-1, 1920x1080, 0x0, 1";
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
        "$mod, Return, exec, kitty"
        "$mod Shift, Q, killactive"
        "$mod, SUPER_L, exec, pkill fuzzel || fuzzel"
        "$mod, H, movefocus, l"
        "$mod, J, movefocus, d"
        "$mod, K, movefocus, u"
        "$mod, L, movefocus, r"

        "$mod Shift, H, swapwindow, l"
        "$mod Shift, J, swapwindow, d"
        "$mod Shift, K, swapwindow, u"
        "$mod Shift, L, swapwindow, r"

        "$mod, F, fullscreen"
        "$mod Shift, Space, togglefloating"
      ];
      exec-once = [
        "waybar"
        "wpaperd -d"
      ] ++ lib.optional vnc.enable "wayvnc 0.0.0.0";
      misc = {
        middle_click_paste = false;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
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
        blur = {
          enabled = true;
          size = 1;
        };
      };
    };
  };
}

