{
  envFeatures = {
    hardware.isVirtual = false;
  };
  imports = [
    ../../common.nix
  ];
  networking.hostName = "coffee-pot";
}
