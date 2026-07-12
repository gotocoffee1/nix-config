{ role, so, ... }:
{
  so.libreoffice = {
    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home.packages = with pkgs; [
          libreoffice
        ];
        # https://github.com/nix-community/home-manager/issues/6188
        gtk.gtk2.force = true;
      };
  };
  so.firefox = {
    includes = [
      role.firefox
    ];
    homeManager = {
      programs.firefox = {
        profiles.default = {
          search =
            let
              engine = "ecosia";
            in
            {
              force = true;
              default = engine;
              privateDefault = engine;
            };
          settings = {
          };
        };
      };
    };
  };
}
