{ lib, ... }:
{
  system.nixos.tags = [ "desktop" ];
  envFeatures = lib.mkDefault {
    gui.enable = true;
    ssh.enable = false;
  };
}

