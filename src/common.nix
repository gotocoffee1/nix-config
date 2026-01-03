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
    /etc/nixos/hardware-configuration.nix
    ./flavors/desktop.nix
  ]
  ++ lib.optional (builtins.pathExists ./extra/default.nix) ./extra;
  specialisation = {
    headless.configuration = {
      imports = [
        ./flavors/headless.nix
      ];
    };
  };
  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

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

  # Configure keymap in X11
  #  services.xserver = {
  #    layout = "de";
  #    xkbVariant = "";
  #  };

  # Configure console keymap
  console.keyMap = "de";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    defaultUserShell = pkgs.fish;
    users.gotocoffee = {
      isNormalUser = true;
      description = "gotocoffee";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      packages = with pkgs; [ ];
      openssh.authorizedKeys.keyFiles = lib.optional features.ssh.enable ./home/gotocoffee/keys/id_ed25519.pub;
    };
  };

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    users.gotocoffee = {
      imports = [
        ./home/gotocoffee
      ];
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  environment.systemPackages = with pkgs; [
  ];

  programs = {
    nix-ld.enable = true;
    hyprland.enable = features.gui.enable;
    steam.enable = features.gui.enable && features.gui.gaming.enable;
    fish.enable = true;

    direnv.enable = true;
    ssh.startAgent = true;
    dconf.enable = true; # https://github.com/danth/stylix/issues/139
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services = {
    openssh = {
      enable = features.ssh.enable;
      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
      };
    };
    greetd = {
      enable = features.gui.enable;
      settings = rec {
        initial_session = {
          command = "Hyprland";
          user = "gotocoffee";
        };
        default_session = initial_session;
      };
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
