{
  config,
  lib,
  ...
}:
with lib;
let
  gui = config.homeFeatures.gui;
  hardware = config.homeFeatures.hardware;
in
{
  config = mkIf gui.enable {
    wayland.windowManager.hyprland =
      let
        key = import ./key.nix {
          gui = gui;
          lib = lib;
        };
      in
      {
        enable = true;
        #configType = "hyprlang";
        settings = {
          monitor = hardware.monitor;
          workspace_rule =
            let
              workspaces =
                monitors:
                let
                  per = builtins.div 10 (builtins.length monitors);
                  num = n: i: toString (n * per + i + 1);
                  make =
                    n: monitor:
                    builtins.genList (i: {
                      workspace = (num n i);
                      monitor = monitor.output;
                    }) per;
                  result = lists.imap0 make monitors;
                in
                concatLists result;
            in
            workspaces hardware.monitor
            ++ [
              {
                workspace = "special:special";
                on_created_empty = "kitty zellij --layout ${./special.kdl}";
              }
            ];
          window_rule = [
            {
              name = "pnp";
              match.title = "(Picture-in-Picture)";
              size = [
                640
                360
              ];
              float = true;
              pin = true;
              keep_aspect_ratio = true;

            }
          ];
          config = {
            input = {
              kb_layout = config.homeFeatures.hardware.kbLayout;
              kb_variant = "nodeadkeys";
              numlock_by_default = true;
              touchpad = {
                natural_scroll = true;
                disable_while_typing = true;
                clickfinger_behavior = true;
              };
            };
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
          };
        }
        // key;
      };
  };
}
