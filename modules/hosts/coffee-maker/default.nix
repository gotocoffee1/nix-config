{
  den,
  gtc,
  ...
}:
{
  den.hosts.x86_64-linux.coffee-maker = {
    hardware.monitor = [
      "HDMI-A-1, 2560x1440@143.91, 0x0, 1"
      "DP-2, 1920x1080, 2560x200, 1"
    ];

    users.gotocoffee = {
      isPrimary = true;
    };
  };
  den.aspects.coffee-maker = {
    provides.gotocoffee = {
      includes = [
        gtc.gui-desktop
        gtc.gaming
      ];
    };
    includes = [
      den.aspects.common
      den.aspects.core
      den.aspects.gui-desktop
    ];
    nixos = { lib, config, ... }: {
      imports = [
        ./_hardware-configuration.nix
      ];

      networking.hostId = "a91287a0";
      boot.supportedFilesystems = [ "zfs" ];
      boot.zfs.forceImportRoot = false;
      boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
    };
  };
}
