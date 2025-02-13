{ lib, config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz";
  features = config.envFeatures;
in
{
  imports = [
    ./features.nix
    /etc/nixos/hardware-configuration.nix
    ./flavors/desktop.nix
    (import "${home-manager}/nixos")
  ];
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
    hostName = "nixos"; # Define your hostname.
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [ 5900 ];
  };
  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
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
      extraGroups = [ "networkmanager" "wheel" ];
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

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  programs = {
    nix-ld.enable = true;
    hyprland.enable = features.gui.enable;
    firefox.enable = features.gui.enable;
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

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}

