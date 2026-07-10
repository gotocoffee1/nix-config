{ gtc, ... }:
{
  den.hosts.x86_64-linux.coffee-grounds = {
    users = {
      gotocoffee = {
        isPrimary = true;
      };
    };
  };

  den.aspects.coffee-grounds = {
    provides.gotocoffee = {
      includes = [
        gtc.server
      ];
    };
    includes = [
    ];
    nixos = { lib, ... }: {
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
    };
  };
}
