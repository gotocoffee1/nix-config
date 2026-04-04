{ lib, ... }:
{
  imports = [
    ../../common.nix
    ../../core.nix
    ../../specialisations/headless.nix
  ]
  ++ [
    (import ../../users {
      gotocoffee = {
        profile = "devel";
        isMainUser = true;
        enableExtra = false;
      };
    })
  ];

  virtualisation.vmVariant = {
    virtualisation = {
      memorySize = 8 * 1024;
      diskSize = 100 * 1024;
      cores = 4;
      writableStoreUseTmpfs = false;
      graphics = false;
      forwardPorts = [
        {
          from = "host";
          host.port = 2222;
          guest.port = 22;
        }
      ];
      sharedDirectories = {
        devel = {
          source = "/home/gotocoffee/devel";
          target = "/home/gotocoffee/devel";
        };
      };
    };
  };
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
