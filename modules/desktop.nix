{ den, ... }:
{
  den.aspects.desktop = {
    includes = [
      den.aspects.greeter
      den.aspects.bluetooth
      den.aspects.printer_scanner
    ];
    nixos = {

      envFeatures = {
        gui.enable = true;
        ssh.enable = true;
      };
      #
      # specialisation = {
      #   headless.configuration = {
      #     imports = [
      #       ./specialisations/headless.nix
      #     ];
      #   };
      # };
      services = {
        kmscon = {
          enable = true;
          useXkbConfig = true;
        };
      };
      # for pipewire
      security.rtkit.enable = true;
    };
  };
}
