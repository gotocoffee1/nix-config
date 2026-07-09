{ role, ... }:
{
  role.desktop = {
    includes = [
      role.bluetooth
      role.printer_scanner
    ];
    nixos = {
      services = {
        kmscon = {
          enable = true;
          useXkbConfig = true;
        };
      };
      # for pipewire
      security.rtkit.enable = true;

      # TODO: check what is needed

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

    provides.to-users.homeManager = {
      xdg.userDirs = {
        enable = true;
        createDirectories = true;
      };
    };
  };
  role.gui-desktop = {
    includes = [
      role.desktop
      role.greeter
    ];
  };
}
