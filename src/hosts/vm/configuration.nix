{
  envFeatures = {
    hardware.isVirtual = true;
    gui = {
      monitor = [ "Virtual-1, 1920x1080, 0x0, 1" ];
    };
  };
  imports = [
    ../../common.nix
  ];
  networking.hostName = "coffee-bean";
}
