{ den, lib, ... }:
{
  den.schema.user.classes = lib.mkDefault [ "homeManager" ];
  den.aspects.common = {
    nixos =
      {
        lib,
        config,
        pkgs,
        ...
      }:
      {
        home-manager = {
          useUserPackages = true;
          useGlobalPkgs = true;
          backupFileExtension = "backup";
        };
        # Bootloader.
        boot.loader = {
          systemd-boot.enable = true;
          efi.canTouchEfiVariables = true;
        };

        # Allow unfree packages
        nixpkgs.config.allowUnfree = true;

        programs = {
          nix-ld.enable = true;
          direnv.enable = true;
          dconf.enable = true; # https://github.com/danth/stylix/issues/139
        };

        services = {
          kmscon = {
            enable = true;
            useXkbConfig = true;
          };
        };

      };
  };
}
