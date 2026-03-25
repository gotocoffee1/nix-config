{ lib, ... }:
let
  users = {
    gotocoffee = {
      profile = "server";
      isMainUser = true;
      enableExtra = false;
    };
  };
in
{
  imports = [
    ../../core.nix
    ../../specialisations/headless.nix
  ]
  ++ [
    (import ../../users users)
  ];
  boot.initrd.availableKernelModules = [
    "ata_piix"
    "xhci_pci"
    "ahci"
    "usb_storage"
    "uas"
    "sd_mod"
    "sr_mod"
  ];
  security.sudo.wheelNeedsPassword = false;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
