{
  envFeatures = {
    gui = {
      gaming.enable = true;
    };
  };
  imports = [
    ../../common.nix
    ../../core.nix
    ../../desktop.nix
    ./hardware-configuration.nix
  ]
  ++ [
    (import ../../users {
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
  networking.hostId = "a91287a0";
  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.forceImportRoot = false;
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
}
