{
  den,
  gtc,
  ...
}:
{
  den.schema.user = { lib, ... }: with lib;
    {
      options = {
        isPrimary = mkEnableOption "is primary user";
        gui = {
          terminal = mkOption {
            type = types.str;
            default = "kitty";
          };
          explorer = mkOption {
            type = types.str;
            default = "yazi";
          };
          rounding = mkOption {
            type = types.ints.unsigned;
            default = 12;
          };
          border = mkOption {
            type = types.ints.unsigned;
            default = 2;
          };
        };
        fonts =
          let
            mkFont = name: package: {
              name = mkOption {
                type = types.str;
                default = name;
              };
              package = mkOption {
                type = types.package;
                default = package;
              };
            };
          in
          {
            serif = mkFont "DejaVu Serif" pkgs.dejavu_fonts;
            sans = mkFont "DejaVu Sans" pkgs.dejavu_fonts;
            mono = mkFont "FiraCode Nerd Font" pkgs.nerd-fonts.fira-code;
            emoji = mkFont "Noto Color Emoji" pkgs.noto-fonts-color-emoji;
          };
      };
    };

  den.schema.host = { lib, ... }: with lib;
    {
      options = {
        hardware = {
          monitor = mkOption {
            type = types.listOf types.str;
          };
          kbLayout = mkOption {
            type = types.str;
            default = "de";
          };
          isVirtual = mkEnableOption "Is virtual enviroment";
          hasBattery = mkEnableOption "Device has battery";
        };
      };
    };
  den.aspects.gotocoffee = { ... }: {
    includes = [
      gtc.core
      gtc.locale
      gtc.ssh
    ];
  };
  den.hosts.x86_64-linux.coffee-maker = {
    hardware.monitor = [
      "HDMI-A-1, 2560x1440@143.91, 0x0, 1"
      "DP-2, 1920x1080, 2560x200, 1"
    ];

    users.gotocoffee = {
      isPrimary = true;
    };
  };
  den.aspects.coffee-maker = {
    provides.gotocoffee = {
      includes = [
        gtc.hyprland
        gtc.music
        gtc.neovim
        gtc.shell
        gtc.tools
        gtc.vcs
        gtc.gui
        gtc.gaming
        gtc.office
        gtc.style
      ];
    };
    includes = [
      den.aspects.common
      den.aspects.core
      den.aspects.desktop
    ];
    nixos = { lib, config, ... }: {
      imports = [
        ./_hardware-configuration.nix
      ]
      ++ [
        (import ../../../src/users {
          gotocoffee = {
            profile = "desktop";
            isMainUser = true;
            features = {
            };
          };
        })
      ];

      networking.hostId = "a91287a0";
      boot.supportedFilesystems = [ "zfs" ];
      boot.zfs.forceImportRoot = false;
      boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
    };
  };
}
