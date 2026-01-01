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
      caelestia,
      sops-nix,
      ...
    }@inputs:
    {
      nixosConfigurations =
        let
          modules = [
            home-manager.nixosModules.home-manager
            sops-nix.nixosModules.sops
            {
              home-manager.sharedModules = [
                stylix.homeModules.stylix
                caelestia.homeManagerModules.default
                sops-nix.homeManagerModules.sops
              ];
              home-manager.extraSpecialArgs = { inherit inputs; };
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
          desktop = nixpkgs.lib.nixosSystem {
            modules = modules ++ [ ./src/hosts/desktop/configuration.nix ];
          };
        };
    };
}
