{
  gtc.gaming = {
    nixos = { pkgs, ... }: {
      programs = {
        steam.enable = true;
      };
      services.flatpak.enable = true;
      xdg = {
        portal = {
          enable = true;
          extraPortals = [
            pkgs.xdg-desktop-portal-gtk
          ];
        };
      };
    };
    homeManager =
      { pkgs, ... }:
      {
        # https://github.com/NixOS/nixpkgs/issues/195512
        #home.packages = with pkgs; [ discord ];
      };
  };
}
