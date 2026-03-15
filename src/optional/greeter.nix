{
  config,
  lib,
  pkgs,
  ...
}:
let
  features = config.envFeatures;
in
{
  services = {
    greetd = {
      enable = features.gui.enable;
      useTextGreeter = true;
      settings = {
        default_session = {
          command = lib.concatStringsSep " " [
            "${pkgs.tuigreet}/bin/tuigreet"
            "--time --remember --remember-user-session --user-menu --asterisks"
            "--theme 'border=magenta;text=cyan;prompt=green;time=red;action=blue;button=yellow;container=black;input=red'"
          ];
          user = "greeter";
        };
      };
    };
  };
}
