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
            {
              output = "HDMI-A-1";
              mode = "2560x1440@143.91";
              position = "0x0";
              scale = 1;
            }
            {
              output = "DP-2";
              mode = "1920x1080";
              position = "2560x200";
              scale = 1;
            }
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
