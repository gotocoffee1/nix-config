{ gui, lib, ... }:
let
  resizeStep = "10";
  lua = lib.generators.mkLuaInline;
  dsp = {
    exec = cmd: lua ''hl.dsp.exec_cmd("${cmd}")'';
    close = lua "hl.dsp.window.close()";
    fullscreen = lua "hl.dsp.window.fullscreen()";
    focus = dir: lua ''hl.dsp.focus({ direction = "${dir}")'';
    window = {
      move = dir: lua ''hl.dsp.window.move({ direction = "${dir}")'';
    };
  };
  binde = keys: dispatcher: {
    _args = [
      keys
      dispatcher
    ];
  };
  bind = keys: dispatcher: {
    _args = [
      (lua ''mod .. " + ${keys}"'')
      (lua "hl.dsp.${dispatcher}")
    ];
  };
  binda = keys: dispatcher: args: {
    _args = [
      (lua ''mod .. " + ${keys}"'')
      (lua "hl.dsp.${dispatcher}")
      (lua args)
    ];
  };
in
{
  # submaps = {
  #   resize = {
  #     settings = {
  #       binde = [
  #         ", H, resizeactive, -${resizeStep} 0"
  #         ", J, resizeactive, 0 ${resizeStep}"
  #         ", K, resizeactive, 0 -${resizeStep}"
  #         ", L, resizeactive, ${resizeStep} 0"
  #         ", Return, submap, reset"
  #         ", Escape, submap, reset"
  #       ];
  #     };
  #   };
  # };
  define_submap = {
    _args = [
      "resize"
      (lib.generators.mkLuaInline "function()\n  hl.bind(\"right\", hl.dsp.window.resize({ x = ${resizeStep}, y = 0, relative = true }), { repeating = true })\n  hl.bind(\"left\", hl.dsp.window.resize({ x = -${resizeStep}, y = 0, relative = true }), { repeating = true })\n  hl.bind(\"escape\", hl.dsp.submap(\"reset\"))\nend")
    ];
  };

  mod = {
    _var = "SUPER";
  };
  bind = [
    # https://i3wm.org/docs/refcard.html
    # Basics
    (bind "Return" ''exec_cmd("${gui.terminal}")'')
    (bind "H" ''focus({ direction = "left" })'')
    (bind "J" ''focus({ direction = "down" })'')
    (bind "K" ''focus({ direction = "up" })'')
    (bind "L" ''focus({ direction = "right" })'')
    # Moving windows
    (bind "SHIFT + H" ''window.move({ direction = "left" })'')
    (bind "SHIFT + J" ''window.move({ direction = "down" })'')
    (bind "SHIFT + K" ''window.move({ direction = "up" })'')
    (bind "SHIFT + L" ''window.move({ direction = "right" })'')
    (bind "F" "window.fullscreen()")
    (bind "R" ''submap("resize")'')
    # Floating
    (bind "SHIFT + Space" "window.float()")
    # Using workspaces
    (bind "1" ''focus({ workspace = "1" })'')
    (bind "2" ''focus({ workspace = "2" })'')
    (bind "3" ''focus({ workspace = "3" })'')
    (bind "4" ''focus({ workspace = "4" })'')
    (bind "5" ''focus({ workspace = "5" })'')
    (bind "6" ''focus({ workspace = "6" })'')
    (bind "7" ''focus({ workspace = "7" })'')
    (bind "8" ''focus({ workspace = "8" })'')
    (bind "9" ''focus({ workspace = "9" })'')
    (bind "0" ''focus({ workspace = "10" })'')
    (bind "asciicircum" ''workspace.toggle_special("special")'')

    (bind "SHIFT + 1" ''window.move({ workspace = "1" })'')
    (bind "SHIFT + 2" ''window.move({ workspace = "2" })'')
    (bind "SHIFT + 3" ''window.move({ workspace = "3" })'')
    (bind "SHIFT + 4" ''window.move({ workspace = "4" })'')
    (bind "SHIFT + 5" ''window.move({ workspace = "5" })'')
    (bind "SHIFT + 6" ''window.move({ workspace = "6" })'')
    (bind "SHIFT + 7" ''window.move({ workspace = "7" })'')
    (bind "SHIFT + 8" ''window.move({ workspace = "8" })'')
    (bind "SHIFT + 9" ''window.move({ workspace = "9" })'')
    (bind "SHIFT + 0" ''window.move({ workspace = "10" })'')
    (bind "SHIFT + asciicircum" ''window.move({ workspace = "special" })'')

    # Opening applications / Closing windows
    (bind "D" ''global("caelestia:launcher")'')
    (bind "SHIFT + Q" "window.close()")
  ]
  ++ [
    #"Ctrl+Alt, Delete, global, caelestia:session"
    #"$mod, K, global, caelestia:showall"

    #"$mod+Shift, S, global, caelestia:screenshotFreeze" # Capture region (freeze)
    #"$mod+Shift+Alt, S, global, caelestia:screenshot" # Capture region
    # "$mod+Alt, R, exec, caelestia record -s" # Record screen with sound
    # "Ctrl+Alt, R, exec, caelestia record " # Record screen
    # "$mod+Shift+Alt, R, exec, caelestia record -r" # Record region
    # # Clipboard and emoji picker

    #"$mod, V, exec, pkill fuzzel || caelestia clipboard"
    #"$mod+Alt, V, exec, pkill fuzzel || caelestia clipboard -d"
    (bind "Period" ''exec_cmd("pkill fuzzel || caelestia emoji -p")'')

    (bind "XF86Calculator" ''exec_cmd("kitty qalc")'')
    (bind "XF86Tools" ''exec_cmd("kitty rmpc")'')
    (bind "XF86Explorer" ''exec_cmd("kitty yazi")'')
    (bind "E" ''exec_cmd("kitty yazi")'')
    #XF86Search
    (binda "Pause" ''pass({ window = "class:^discord$" })'' "{ locked = true }")

    #"$mod, catchall, global, caelestia:launcherInterrupt"
    (binda "mouse:272" ''global("caelestia:launcherInterrupt")''
      "{ ignore_mods = true, non_consuming = true }"
    )
    (binda "mouse:273" ''global("caelestia:launcherInterrupt")''
      "{ ignore_mods = true, non_consuming = true }"
    )
    (binda "mouse:274" ''global("caelestia:launcherInterrupt")''
      "{ ignore_mods = true, non_consuming = true }"
    )
    (binda "mouse:275" ''global("caelestia:launcherInterrupt")''
      "{ ignore_mods = true, non_consuming = true }"
    )
    (binda "mouse:276" ''global("caelestia:launcherInterrupt")''
      "{ ignore_mods = true, non_consuming = true }"
    )
    (binda "mouse:277" ''global("caelestia:launcherInterrupt")''
      "{ ignore_mods = true, non_consuming = true }"
    )
    (binda "mouse_up" ''global("caelestia:launcherInterrupt")''
      "{ ignore_mods = true, non_consuming = true }"
    )
    (binda "mouse_down" ''global("caelestia:launcherInterrupt")''
      "{ ignore_mods = true, non_consuming = true }"
    )
    (binda "mouse:272" "window.drag()" "{ mouse = true, drag = true }")
    (binda "Control_L" "window.drag()" "{ mouse = true, drag = true }")
    # Misc

    #"Ctrl+Alt, C, global, caelestia:clearNotifs"

    #(bind "Alt + L" ''exec_cmd("caelestia shell -d")'')
    (bind "CTRL + L" ''global("caelestia:lock")'')

    # Brightness
    (binda "XF86MonBrightnessUp" ''global("caelestia:brightnessUp")''
      "{ locked = true, repeating = true }"
    )
    (binda "XF86MonBrightnessDown" ''global("caelestia:brightnessDown")''
      "{ locked = true, repeating = true }"
    )

    (binda "CTRL + Space" ''global("caelestia:mediaToggle")'' "{ locked = true }")
    (binda "XF86AudioPlay" ''global("caelestia:mediaToggle")'' "{ locked = true }")
    (binda "XF86AudioPause" ''global("caelestia:mediaToggle")'' "{ locked = true }")
    (binda "CTRL + Equal" ''global("caelestia:mediaNext")'' "{ locked = true }")
    (binda "XF86AudioNext" ''global("caelestia:mediaNext")'' "{ locked = true }")
    (binda "CTRL + Minus" ''global("caelestia:mediaPrev")'' "{ locked = true }")
    (binda "XF86AudioPrev" ''global("caelestia:mediaPrev")'' "{ locked = true }")
    (binda "XF86AudioStop" ''global("caelestia:mediaStop")'' "{ locked = true }")
    (binda "XF86AudioMute" ''exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")''
      "{ locked = true }"
    )

    (bind "Print" ''exec_cmd("caelestia screenshot")'') # Full screen capture > clipboard

    (binda "XF86AudioRaiseVolume"
      ''exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 10%+")''
      "{ locked = true, repeating = true }"
    )
    (binda "XF86AudioLowerVolume"
      ''exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%-")''
      "{ locked = true, repeating = true }"
    )
  ];
}
