{ role, gtc, ... }:
{
  den.hosts.aarch64-linux.coffee-server = {
    users = {
      gotocoffee = {
        isPrimary = true;
      };
      snow_owlia = { };
    };
  };

  den.aspects.coffee-server = {
    provides.gotocoffee = {
      includes = [
        gtc.server
      ];
    };
    includes = [
      role.pihole
      role.nas
      role.mealie
    ];
    nixos = {
      imports = [
        ./_hardware-configuration.nix
      ];
      boot = {
        loader = {
          grub.enable = false;
          generic-extlinux-compatible.enable = true;
        };
      };
      security.sudo.wheelNeedsPassword = false;
    };
  };
}
