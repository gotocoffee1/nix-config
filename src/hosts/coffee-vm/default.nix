{ lib, ... }:
{
  imports = [
    ../../common.nix
    ../../core.nix
    ../../specialisations/headless.nix
  ];

  virtualisation.vmVariant = {
    virtualisation = {
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
