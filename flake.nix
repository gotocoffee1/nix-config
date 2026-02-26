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
          ];

          makeOS = name: users: entry: {
            ${name} = nixpkgs.lib.nixosSystem {
              modules = modules ++ [
                ./src/hosts/${name}
                {
                  networking.hostName = name;
                }
                entry
              ];
              specialArgs = {
                inherit users;
              };
            };
          };
          common = ./src/common.nix;
          core = ./src/core.nix;
          users1 = [ "gotocoffee" ];
          users2 = [
            "gotocoffee"
            "snow_owlia"
          ];
        in
        { }
        // makeOS "coffee-maker" users1 common
        // makeOS "coffee-pot" users2 common
        // makeOS "coffee-bean" users1 common
        // makeOS "coffee-server" users2 core
        // { };
    };
}
