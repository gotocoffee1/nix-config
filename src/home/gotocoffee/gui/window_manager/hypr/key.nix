{ gui, ... }:
let
  resizeStep = "10";
in
{
  submaps = {
    resize = {
      settings = {
        binde = [
          ", H, resizeactive, -${resizeStep} 0"
          ", J, resizeactive, 0 ${resizeStep}"
          ", K, resizeactive, 0 -${resizeStep}"
          ", L, resizeactive, ${resizeStep} 0"
          ", Return, submap, reset"
          ", Escape, submap, reset"
        ];
      };
    };

  };
  binds = {
    "$mod" = "Super";
    bind = [
      # https://i3wm.org/docs/refcard.html
      # Basics
      "$mod, Return, exec, ${gui.terminal}"
      "$mod, H, movefocus, l"
      "$mod, J, movefocus, d"
      "$mod, K, movefocus, u"
      "$mod, L, movefocus, r"
      # Moving windows
      "$mod Shift, H, movewindow, l"
      "$mod Shift, J, movewindow, d"
      "$mod Shift, K, movewindow, u"
      "$mod Shift, L, movewindow, r"
      # Modifying windows
      "$mod, F, fullscreen"
      "$mod, R, submap, resize"
      # Floating
      "$mod Shift, Space, togglefloating"
      # Using workspaces
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"
      "$mod, 0, workspace, 10"

      "$mod Shift, 1, movetoworkspacesilent, 1"
      "$mod Shift, 2, movetoworkspacesilent, 2"
      "$mod Shift, 3, movetoworkspacesilent, 3"
      "$mod Shift, 4, movetoworkspacesilent, 4"
      "$mod Shift, 5, movetoworkspacesilent, 5"
      "$mod Shift, 6, movetoworkspacesilent, 6"
      "$mod Shift, 7, movetoworkspacesilent, 7"
      "$mod Shift, 8, movetoworkspacesilent, 8"
      "$mod Shift, 9, movetoworkspacesilent, 9"
      "$mod Shift, 0, movetoworkspacesilent, 10"

      # Opening applications / Closing windows
      "$mod, D, global, caelestia:launcher"
      "$mod Shift, Q, killactive"
    ]
    ++ [
      "Ctrl+Alt, Delete, global, caelestia:session"
      #"$mod, K, global, caelestia:showall"
      #"$mod, L, global, caelestia:lock"

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
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, Control_L, movewindow"
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
  };
}
