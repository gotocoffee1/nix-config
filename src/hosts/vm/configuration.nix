{
  envFeatures = {
    hardware.isVirtual = true;
  };
  imports = [
    ../../common.nix
  ];
  networking.hostName = "coffee-bean";
}
