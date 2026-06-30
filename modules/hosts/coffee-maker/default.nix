{
  den,
  gtc,
  ...
}:
{
  den.hosts.x86_64-linux.coffee-maker.users.gotocoffee = {

  };
  den.aspects.gotocoffee = {
    includes = [
      den.batteries.define-user
      den.batteries.primary-user
      (den.batteries.user-shell "fish")
    ];
    homeManager = { pkgs, ... }: {

    };
    provides.coffee-maker = {
      includes = [
        gtc.hyprland
        gtc.music
        gtc.neovim
        gtc.shell
        gtc.tools
        gtc.vcs
      ];
    };
  };
  den.aspects.coffee-maker = {
    includes = [
      den.aspects.common
      den.aspects.core
      den.aspects.desktop
    ];
    nixos = { lib, config, ... }: {
      imports = [
        ../../../src/hosts/coffee-maker/hardware-configuration.nix
      ]
      ++ [
        (import ../../../src/users {
          gotocoffee = {
            profile = "desktop";
            isMainUser = true;
            features = {
              hardware.monitor = [
                "HDMI-A-1, 2560x1440@143.91, 0x0, 1"
                "DP-2, 1920x1080, 2560x200, 1"
              ];
            };
          };
        })
      ];

      envFeatures = {
        gui = {
          gaming.enable = true;
        };
      };
      networking.hostId = "a91287a0";
      boot.supportedFilesystems = [ "zfs" ];
      boot.zfs.forceImportRoot = false;
      boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
    };
  };
}
