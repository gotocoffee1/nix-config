{ den, ... }:
{
  den.aspects.desktop = {
    includes = [
      den.aspects.greeter
      den.aspects.bluetooth
      den.aspects.printer_scanner
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
    };

    provides.to-users.homeManager = {
      xdg.userDirs = {
        enable = true;
        createDirectories = true;
      };
    };
  };
}
