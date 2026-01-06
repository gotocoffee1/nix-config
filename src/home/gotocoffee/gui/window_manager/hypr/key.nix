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

      "$mod, Return, exec, ${gui.terminal}"
      "$mod, H, movefocus, l"
      "$mod, J, movefocus, d"
      "$mod, K, movefocus, u"
      "$mod, L, movefocus, r"

      "$mod Shift, H, swapwindow, l"
      "$mod Shift, J, swapwindow, d"
      "$mod Shift, K, swapwindow, u"
      "$mod Shift, L, swapwindow, r"

      "$mod, F, fullscreen"
      "$mod, R, submap, resize"

      "$mod Shift, Space, togglefloating"

      "$mod Shift, Q, killactive"
      "$mod, D, global, caelestia:launcher"
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
