{
  envFeatures = {
    hardware.isVirtual = false;
    gui = {
      monitor = [
        "eDP-1, preferred, auto, 1"
      ];
    };
  };
  imports = [ ./hardware-configuration.nix ];
}
