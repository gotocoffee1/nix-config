{
  description = "NixOS flake";

  inputs = {
    self.submodules = true;
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    caelestia = {
      url = "github:caelestia-dots/shell";
      #inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      stylix,
      caelestia,
      ...
    }@inputs:
    {
      nixosConfigurations =
        let
          modules = [
            home-manager.nixosModules.home-manager
            {
              home-manager.sharedModules = [
                stylix.homeModules.stylix
                caelestia.homeManagerModules.default
              ];
            }
          ];
        in
        {
          vm = nixpkgs.lib.nixosSystem {
            modules = modules ++ [ ./src/hosts/vm/configuration.nix ];
          };
          laptop = nixpkgs.lib.nixosSystem {
            modules = modules ++ [ ./src/hosts/laptop/configuration.nix ];
          };
        };
    };
}
