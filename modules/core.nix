{
  den,
  inputs,
  role,
  ...
}:
{
  imports = [ (inputs.den.namespace "role" false) ];
  den.default =
    let
      stateVersion = "26.05";
    in
    {
      includes = [
        den.batteries.hostname
        role.core
      ];
      nixos = {
        imports = with inputs; [
          home-manager.nixosModules.home-manager
          stylix.nixosModules.stylix
          sops-nix.nixosModules.sops
          disko.nixosModules.disko
          {
            home-manager.sharedModules = [
              nixvim.homeModules.nixvim
              caelestia.homeManagerModules.default
              sops-nix.homeManagerModules.sops
            ];
            home-manager.extraSpecialArgs = { inherit inputs; };
          }
        ];
        system.stateVersion = stateVersion;
      };
      homeManager = {
        home.stateVersion = stateVersion;
      };
    };

  role.core = { host, ... }: {
    nixos =
      {
        lib,
        config,
        pkgs,
        ...
      }:
      let
        hardware = host.hardware;
      in
      {
        nix.settings = {
          experimental-features = [
            "nix-command"
            "flakes"
          ];
          trusted-users = [ "@wheel" ];
        };

        home-manager = {
          useUserPackages = true;
          useGlobalPkgs = true;
          backupFileExtension = "backup";
        };

        users.mutableUsers = false;

        networking = {
          networkmanager.enable = true;
          firewall.allowedTCPPorts = [ ];
        };
        # Set your time zone.
        time.timeZone = "Europe/Berlin";

        # Configure console keymap
        console.useXkbConfig = true;

        services = {
          xserver.xkb = {
            layout = hardware.kbLayout;
            variant = "nodeadkeys";
          };
          openssh = {
            settings = {
              PasswordAuthentication = false;
              KbdInteractiveAuthentication = false;
            };
          };
        };
      };
  };
}
