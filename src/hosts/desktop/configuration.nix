{
  envFeatures = {
    gui = {
      gaming.enable = true;
      monitor = [
        "HDMI-A-1, 1920x1080, 0x0, 1"
        "DP-2, 1920x1080, 1920x200, 1"
      ];
    };
  };
  imports = [
    ../../common.nix
  ];
  networking.hostName = "coffee-maker";
}
