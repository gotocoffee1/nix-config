{
  pkgs,
  config,
  lib,
  ...
}:
with lib;
let
  gui = config.homeFeatures.gui;
  vnc = gui.vnc;
in
{
  config = mkIf gui.enable {
    home.packages = with pkgs; [ kdePackages.dolphin ] ++ lib.optional vnc.enable wayvnc;

    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        "$mod" = "Super";
        monitor = [ "Virtual-1, 1920x1080, 0x0, 1" ];
        input = {
          kb_layout = "de";
          numlock_by_default = true;
          touchpad = {
            natural_scroll = true;
            disable_while_typing = true;
            clickfinger_behavior = true;
          };
        };
        exec = [ "hyprctl dispatch submap global" ];
        submap = "global";
        bind = [
          "$mod, Return, exec, ${gui.terminal}"
          "$mod Shift, Q, killactive"
          #"$mod, D, exec, pkill fuzzel || fuzzel"
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

          "$mod, D, global, caelestia:launcher"
          "Ctrl+Alt, Delete, global, caelestia:session"
          "$mod, K, global, caelestia:showall"
          "$mod, L, global, caelestia:lock"

          "$mod+Shift, S, global, caelestia:screenshotFreeze" # Capture region (freeze)
          "$mod+Shift+Alt, S, global, caelestia:screenshot" # Capture region
          "$mod+Alt, R, exec, caelestia record -s" # Record screen with sound
          "Ctrl+Alt, R, exec, caelestia record " # Record screen
          "$mod+Shift+Alt, R, exec, caelestia record -r" # Record region
          # Clipboard and emoji picker

          "$mod, V, exec, pkill fuzzel || caelestia clipboard"
          "$mod+Alt, V, exec, pkill fuzzel || caelestia clipboard -d"
          "$mod, Period, exec, pkill fuzzel || caelestia emoji -p"
        ];

        bindin = [
          #"$mod, catchall, global, caelestia:launcherInterrupt"
          "$mod, mouse:272, global, caelestia:launcherInterrupt"
          "$mod, mouse:273, global, caelestia:launcherInterrupt"
          "$mod, mouse:274, global, caelestia:launcherInterrupt"
          "$mod, mouse:275, global, caelestia:launcherInterrupt"
          "$mod, mouse:276, global, caelestia:launcherInterrupt"
          "$mod, mouse:277, global, caelestia:launcherInterrupt"
          "$mod, mouse_up, global, caelestia:launcherInterrupt"
          "$mod, mouse_down, global, caelestia:launcherInterrupt"
        ];

        bindl = [
          # Misc

          "Ctrl+Alt, C, global, caelestia:clearNotifs"

          "$mod+Alt, L, exec, caelestia shell -d"
          "$mod+Alt, L, global, caelestia:lock"

          # Brightness
          ", XF86MonBrightnessUp, global, caelestia:brightnessUp"
          ", XF86MonBrightnessDown, global, caelestia:brightnessDown"

          "Ctrl+$mod, Space, global, caelestia:mediaToggle"
          ", XF86AudioPlay, global, caelestia:mediaToggle"
          ", XF86AudioPause, global, caelestia:mediaToggle"
          "Ctrl+$mod, Equal, global, caelestia:mediaNext"
          ", XF86AudioNext, global, caelestia:mediaNext"
          "Ctrl+$mod, Minus, global, caelestia:mediaPrev"
          ", XF86AudioPrev, global, caelestia:mediaPrev"
          ", XF86AudioStop, global, caelestia:mediaStop"

          ", Print, exec, caelestia screenshot" # Full screen capture > clipboard
        ];
        exec-once = [
          "caelestia-shell -d"
        ]
        ++ lib.optional vnc.enable "wayvnc 127.0.0.1";
        env = [
          "GTK_USE_PORTAL,1"
          "QT_QPA_PLATFORMTHEME,qt5ct"
          "QT_STYLE_OVERRIDE,kvantum"
        ];
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
          border_size = gui.border;
        };
        decoration = {
          rounding = gui.rounding;
          blur = {
            enabled = true;
            size = 1;
          };
        };
      };
    };
    xdg.configFile."kdeglobals".text = ''
      [General]
      TerminalApplication=${gui.terminal}
    '';
    xdg.portal = {
      enable = true;
      extraPortals = [
        pkgs.kdePackages.xdg-desktop-portal-kde
      ];
      config.hyprland = {
        default = [
          "hyprland"
          "gtk"
        ];
        "org.freedesktop.impl.portal.FileChooser" = "kde";
      };
    };
  };
}
