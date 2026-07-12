{
  den.schema.user = { lib, ... }: with lib;
    {
      config.classes = lib.mkDefault [ "homeManager" ];
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
}
