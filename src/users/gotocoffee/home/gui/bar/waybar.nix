{ config, ... }:
let
  gui = config.homeFeatures.gui;
in
{
  programs.waybar = {
    enable = gui.enable;
    #style = (builtins.readFile ./style.css);
    settings = {
      mainBar = {
        layer = "top";
        position = "left";
        spacing = 0;
        width = 36;
        fixed-center = false;
        modules-left = [
          "idle_inhibitor"
          "group/privacygroup"
          #"sway/scratchpad"
          "hyprland/workspaces"
        ];
        modules-center = [
          "hyprland/window"
          "hyprland/submap"
        ];
        modules-right = [
          "tray"
          "backlight"
          #"pulseaudio"
          #"pulseaudio#source"
          "network"
          #"bluetooth"
          "cpu"
          "memory"
          "temperature"
          "battery"
          "clock"
        ];
        backlight = {
          format = "{icon}";
          format-icons = [ "󰛩" "󱩎" "󱩏" "󱩐" "󱩑" "󱩒" "󱩓" "󱩔" "󱩕" "󱩖" "󰛨" ];
          tooltip = false;
        };
        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          bat = "BAT1";
          adapter = "ACAD";
          format = "{capacity}\n{icon}";
          format-charging = "{capacity}\n󰂄";
          format-full = "{capacity}\n󰂄";
          format-icons = [ "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
          tooltip = true;
          tooltip-format = "{timeTo}\nPower: {power} Watt";
        };
        clock = {
          format = "{:%H\n%M}";
          tooltip = true;
          tooltip-format = "<small>{calendar}</small>";
          calendar = {
            mode = "month";
            weeks-pos = "left";
            on-scroll = 1;
            format = {
              months = "<span color='#d4be98'><b>{}</b></span>";
              weeks = "<span color='#7daea3'><b>W{}</b></span>";
              weekdays = "<span color='#d8a657'><b>{}</b></span>";
              days = "<span color='#d4be98'><b>{}</b></span>";
              today = "<span color='#e78a4e'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
        };
        cpu = {
          interval = 10;
          format = "{usage}\n󰍛";
          tooltip = true;
          on-click = "kitty --title 'Floating Kitty btop' --detach btop";
        };
        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "󰛊";
            deactivated = "󰾫";
          };
          tooltip = false;
        };
        memory = {
          interval = 10;
          format = "{percentage}\n{swapPercentage}\n󰧑";
          tooltip = true;
          tooltip-format = "RAM:\nUsed: {used} GiB\nAvailable: {avail} GiB\n\nSwap:\nUsed: {swapUsed} GiB\nAvailable: {swapAvail} GiB";
          on-click = "kitty --title 'Floating Kitty btop' --detach btop";
        };
        network = {
          format-wifi = "󰤯";
          format-disconnected = "󰤫";
          format-disabled = "󰤮";
          format-ethernet = "󰈀";
          tooltip-format = "subject name to change when on ethernet {ifname} via {gwaddr} 󰈀";
          tooltip-format-wifi = "ESSID: {essid}\nFrequency: {frequency} GHz\nStrength: {signalStrength}%\nIP: {ipaddr}";
          tooltip-format-disconnected = "Disconnected";
          on-click-right = "rfkill toggle wifi";
          on-click = "kitty --title 'Floating Kitty nmtui' --detach nmtui connect";
        };
        "hyprland/window" = {
          format = "{class}\t{title}";
          icon = false;
          max-length = 300;
          rotate = 90;
          tooltip = false;
        };
        "hyprland/workspaces" = {
          disable-scroll = true;
          disable-click = false;
        };
        temperature = {
          thermal-zone = 5;
          critical-threshold = 80;
          format = "{temperatureC}\n{icon}";
          format-icons = [ "" "" "" "" "" ];
          interval = 10;
          tooltip = false;
          on-click = "kitty --title 'Floating Kitty btop' --detach btop";
        };
        tray = {
          icon-size = 20;
          show-pasive-items = true;
          smooth-scrolling-threshold = 1;
          spacing = 3;
        };
      };
    };
  };
}#
