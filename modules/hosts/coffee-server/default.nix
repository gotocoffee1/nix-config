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
    provides.snow_owlia = {
      includes = [
      ];
    };
    includes = [
      role.pihole
      role.nas
      role.mealie
      role.git
      # Maybe https://github.com/denful/den/issues/473
      role.nas-user
    ];
    nixos = { pkgs, ... }: {
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
      environment.variables.PATH = [
        "${pkgs.openssh}/libexec"
      ];
      networking.firewall.allowedTCPPorts = [
        80
        443
      ];
    };
  };
}
