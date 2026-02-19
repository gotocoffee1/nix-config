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
  imports = [
    ./features.nix
    ./users
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking = {
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [ ];
  };
  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n =
    let
      locale = "de_DE.UTF-8";
    in
    {
      defaultLocale = "en_US.UTF-8";
      extraLocaleSettings = {
        LC_ADDRESS = locale;
        LC_IDENTIFICATION = locale;
        LC_MEASUREMENT = locale;
        LC_MONETARY = locale;
        LC_NAME = locale;
        LC_NUMERIC = locale;
        LC_PAPER = locale;
        LC_TELEPHONE = locale;
        LC_TIME = locale;
      };
    };

  # Configure console keymap
  console.useXkbConfig = true;

  # Enable the OpenSSH daemon.
  services = {
    xserver.xkb = {
      layout = features.kb_layout;
      variant = "nodeadkeys";
    };
    openssh = {
      enable = features.ssh.enable;
      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
      };
    };
  };
}
