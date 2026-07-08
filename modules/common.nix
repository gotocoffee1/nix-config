{ den, ... }:
{
  den.aspects.common = {
    nixos =
      {
        lib,
        config,
        pkgs,
        ...
      }:
      {
        # Bootloader.
        boot.loader = {
          systemd-boot.enable = true;
          efi.canTouchEfiVariables = true;
        };

        # Allow unfree packages
        nixpkgs.config.allowUnfree = true;

        programs = {
          nix-ld.enable = true;
        };
      };
  };
}
