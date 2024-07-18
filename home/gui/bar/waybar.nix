{...}:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "left";
        modules-left = [
          "hyprland/workspaces"
          "wlr/taskbar"
        ];
        modules-right = [
         # "backlight/slider"
         # "bluetooth"
          "battery"
          "clock"
        ];
        clock = {
          interval = 60;
          tooltip = true;
          format = "{:%H:%M}";
        };
      };       
    };
  };
}
