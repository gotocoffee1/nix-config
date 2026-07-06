{
  gtc.style =
    { user, ... }:
    let
      style =
        { pkgs, ... }:
        let
          fonts =
            let
              mkFont = name: package: {
                name = name;
                package = package;
              };
            in
            {
              serif = mkFont "DejaVu Serif" pkgs.dejavu_fonts;
              sans = mkFont "DejaVu Sans" pkgs.dejavu_fonts;
              mono = mkFont "FiraCode Nerd Font" pkgs.nerd-fonts.fira-code;
              emoji = mkFont "Noto Color Emoji" pkgs.noto-fonts-color-emoji;
            };
        in
        {
          enable = true;
          overlays.enable = false; # #1832
          polarity = "dark";
          base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark.yaml";
          fonts = {
            monospace = fonts.mono;
            serif = fonts.serif;
            sansSerif = fonts.sans;
            emoji = fonts.emoji;
            sizes = {
              popups = 12;
              desktop = 12;
              terminal = 12;
            };
          };
        };
    in
    {
      nixos =
        {
          pkgs,
          lib,
          config,
          ...
        }:
        lib.mkIf user.isPrimary {
          stylix = {
          }
          // (style {
            inherit pkgs;
          });
        };
      homeManager =
        { pkgs, config, ... }:
        {
          stylix = {
            icons = {
              enable = true;
              package = pkgs.gruvbox-plus-icons;
              light = "Gruvbox-Plus-Light";
              dark = "Gruvbox-Plus-Dark";
            };
            opacity = {
              terminal = 0.7;
              popups = 0.8;
            };
            cursor = {
              name = "phinger-cursors-dark";
              package = pkgs.phinger-cursors;
              size = 16;
            };
            targets = {
              neovim.enable = false;
              nixvim.enable = false;
              starship.enable = false;
              qt.enable = true;
              firefox.profileNames = [ "default" ];
            };
          }
          // (style {
            inherit pkgs;
          });
        };
    };
}
