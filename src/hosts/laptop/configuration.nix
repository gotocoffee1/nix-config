{
  envFeatures = {
    hardware.isVirtual = false;
    gui = {
      monitor = [
        "eDP-1, preferred, auto, 1"
      ];
    };
  };
  imports = [
    ../../common.nix
  ];
  networking.hostName = "coffee-pot";
}
