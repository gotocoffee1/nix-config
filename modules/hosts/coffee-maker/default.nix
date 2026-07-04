{
  den,
  gtc,
  ...
}:
{
  den.schema.user = { lib, ... }: {
    options.isPrimary = lib.mkEnableOption "is primary user";
  };
  den.aspects.gotocoffee = { ... }: {
    includes = [
      gtc.core
      gtc.locale
      gtc.ssh
    ];
  };
  den.hosts.x86_64-linux.coffee-maker.users.gotocoffee = {
    isPrimary = true;
  };
  den.aspects.coffee-maker = {
    provides.gotocoffee = {
      includes = [
        gtc.hyprland
        gtc.music
        gtc.neovim
        gtc.shell
        gtc.tools
        gtc.vcs
        gtc.gui
        gtc.gaming
        gtc.office
        gtc.style
      ];
    };
    includes = [
      den.aspects.common
      den.aspects.core
      den.aspects.desktop
    ];
    nixos = { lib, config, ... }: {
      imports = [
        ./_hardware-configuration.nix
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
