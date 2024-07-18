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
    };
  };
}

