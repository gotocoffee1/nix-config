{
  lib,
  config,
  pkgs,
  ...
}:
let
  features = config.envFeatures;
in
{
  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
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

}
