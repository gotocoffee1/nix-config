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
    home.packages = with pkgs; lib.optional vnc.enable wayvnc;

    wayland.windowManager.hyprland =
      let
        key = import ./key.nix { gui = gui; };
      in
      {
        enable = true;
        submaps = key.submaps;

        settings = {
          monitor = gui.monitor;
          workspace =
            let
              workspaces =
                monitors:
                let
                  per = builtins.div 10 (builtins.length monitors);
                  getName = s: builtins.head (builtins.split "," s);
                  num = n: i: toString (n * per + i + 1);
                  make = n: monitor: builtins.genList (i: "${num n i}, monitor:${getName monitor}") per;
                  result = lists.imap0 make monitors;
                in
                concatLists result;
            in
            workspaces gui.monitor;
          input = {
            kb_layout = config.homeFeatures.kb_layout;
            numlock_by_default = true;
            touchpad = {
              natural_scroll = true;
              disable_while_typing = true;
              clickfinger_behavior = true;
            };
          };

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
            resize_on_border = true;
          };
          decoration = {
            rounding = gui.rounding;
            blur = {
              enabled = true;
              size = 1;
            };
          };
        }
        // key.binds;
      };
  };
}
