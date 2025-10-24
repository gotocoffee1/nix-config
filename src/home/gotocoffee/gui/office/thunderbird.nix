{ config, ... }:
let
  gui = config.homeFeatures.gui;
in
{
  programs.thunderbird = {
    enable = gui.enable;
    settings = {
      "security.prompt_for_master_password_on_startup" = true;
    };
    profiles.main = {
      isDefault = true;
    };
  };
}
