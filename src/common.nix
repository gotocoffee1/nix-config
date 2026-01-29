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
    ./specialisations/gui.nix
    ./style.nix
    ./core.nix
  ]
  ++ lib.optional (builtins.pathExists ./extra/default.nix) ./extra;
  specialisation = {
    headless.configuration = {
      imports = [
        ./specialisations/headless.nix
      ];
    };
  };
  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  users = {
    defaultUserShell = pkgs.fish;
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
  environment.systemPackages = with pkgs; [
  ];

  programs = {
    nix-ld.enable = true;
    hyprland.enable = features.gui.enable;
    steam.enable = features.gui.enable && features.gui.gaming.enable;
    fish.enable = true;

    direnv.enable = true;
    dconf.enable = true; # https://github.com/danth/stylix/issues/139
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services = {
    kmscon = {
      enable = true;
      useXkbConfig = true;
    };
    greetd = {
      enable = features.gui.enable;
      useTextGreeter = true;
      settings = {
        default_session = {
          command = lib.concatStringsSep " " [
            "${pkgs.tuigreet}/bin/tuigreet"
            "--time --remember --remember-user-session --user-menu --asterisks"
            "--theme 'border=magenta;text=cyan;prompt=green;time=red;action=blue;button=yellow;container=black;input=red'"
          ];
          user = "greeter";
        };
      };
    };
    # printer
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    printing = {
      enable = true;
      drivers = with pkgs; [
        cups-filters
        cups-browsed
      ];
    };
  };

  # for pipewire
  security.rtkit.enable = true;

  hardware = {
    # scanner
    sane = {
      enable = true;
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true;
          FastConnectable = true;
        };
        Policy = {
          AutoEnable = true;
        };
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
