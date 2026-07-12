{
  gtc.gui.homeManager =
    {
      pkgs,
      ...
    }:
    {
      xdg = {
        portal = {
          enable = true;
          extraPortals = [
            pkgs.xdg-desktop-portal-termfilechooser
          ];
          config.hyprland = {
            default = [
              "hyprland"
              "gtk"
            ];
            "org.freedesktop.impl.portal.FileChooser" = "termfilechooser";
          };
        };
        configFile."xdg-desktop-portal-termfilechooser/config" = {
          force = true;
          text = ''
            [filechooser]
            cmd=${pkgs.xdg-desktop-portal-termfilechooser}/share/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh
          '';
        };
        terminal-exec = {
          enable = true;
          settings.default = [
            "kitty.desktop"
          ];
        };
      };
    };
}
