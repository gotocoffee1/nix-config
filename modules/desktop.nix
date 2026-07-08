{ den, ... }:
{
  den.aspects.desktop = {
    includes = [
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
  den.aspects.gui-desktop = {
    includes = [
      den.aspects.desktop
      den.aspects.greeter
    ];
  };
}
