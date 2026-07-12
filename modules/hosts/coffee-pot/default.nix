{
  role,
  gtc,
  so,
  ...
}:
{
  den.hosts.x86_64-linux.coffee-pot = {
    hardware = {
      hasBattery = true;
      monitor = [
        "eDP-1, preferred, auto, 1"
      ];
    };
    users = {
      gotocoffee = {
        isPrimary = true;
      };
      snow_owlia = { };
    };
  };
  den.aspects.coffee-pot = {
    provides.gotocoffee.includes = [
      gtc.gui-desktop
    ];

    provides.snow_owlia.includes = [
      so.gui-desktop
    ];

    includes = [
      role.gui-desktop
    ];
    nixos = {
      imports = [
        ./_disko.nix
        ./_hardware-configuration.nix
      ];
    };
  };
}
