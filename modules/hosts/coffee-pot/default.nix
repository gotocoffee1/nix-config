{
  den,
  gtc,
  so,
  ...
}:
{
  den.hosts.x86_64-linux.coffee-pot.users = {
    gotocoffee = {
      isPrimary = true;
    };
    snow_owlia = { };
  };
  den.aspects.coffee-pot = {
    provides.gotocoffee = {
      includes = [
        gtc.hyprland
        gtc.music
        gtc.neovim
        gtc.shell
        gtc.tools
        gtc.vcs
        gtc.gui
        gtc.office
        gtc.style
      ];
    };
    provides.snow_owlia = {
      includes = [
        so.office
        so.plasma
        so.style
      ];
    };
    includes = [
      den.aspects.common
      den.aspects.core
      den.aspects.desktop
    ];
    hardware = {
      hasBattery = true;
      monitor = [
        "eDP-1, preferred, auto, 1"
      ];
    };
    nixos = {
      imports = [
        ./_disko.nix
        ./_hardware-configuration.nix
      ]
      ++ [
        (import ../../../src/users {
          gotocoffee = {
            profile = "desktop";
            isMainUser = true;
            features = {
              hardware = {
              };
            };
          };
          snow_owlia = {
            profile = "desktop";
          };
        })
      ];
    };
  };
}
