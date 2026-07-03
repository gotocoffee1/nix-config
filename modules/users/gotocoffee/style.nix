{
  gtc.style =
    { user, ... }:
    let
      style =
        { pkgs, fonts, ... }:
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
            fonts = config.envFeatures.fonts;
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
            fonts = config.homeFeatures.fonts;
            inherit pkgs;
          });
        };
    };
}
