{
  description = "NixOS flake";

  inputs = {
    self.submodules = true;
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    caelestia = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      stylix,
      nixvim,
      caelestia,
      sops-nix,
      ...
    }@inputs:
    {
      nixosConfigurations =
        let
          modules = [
            home-manager.nixosModules.home-manager
            stylix.nixosModules.stylix
            sops-nix.nixosModules.sops
            {
              home-manager.sharedModules = [
                nixvim.homeModules.nixvim
                caelestia.homeManagerModules.default
                sops-nix.homeManagerModules.sops
              ];
              home-manager.extraSpecialArgs = { inherit inputs; };
            }
            ./src/common.nix
          ];

          makeOS = name: users: {
            ${name} = nixpkgs.lib.nixosSystem {
              modules = modules ++ [
                ./src/hosts/${name}
                {
                  networking.hostName = name;
                }
              ];
              specialArgs = {
                inherit users;
              };
            };
          };
          users1 = [ "gotocoffee" ];
        in
        {
          coffee-server = nixpkgs.lib.nixosSystem {
            modules = [
              ./src/hosts/coffee-server
            ];
            specialArgs = {
              users = users1;
            };
          };
        }

        // makeOS "coffee-maker" users1
        // makeOS "coffee-pot" users1
        // makeOS "coffee-bean" users1;
    };
}
