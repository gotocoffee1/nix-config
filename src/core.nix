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

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    trusted-users = [ "@wheel" ];
  };
  networking = {
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [ ];
  };
  # Set your time zone.
  time.timeZone = "Europe/Berlin";

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
  system.stateVersion = "25.11";
}
