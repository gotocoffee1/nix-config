{ lib, ... }:
{
  envFeatures = lib.mkDefault {
    gui.enable = true;
    ssh.enable = true;
  };
}
