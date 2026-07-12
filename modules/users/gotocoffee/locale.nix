{
  gtc.locale =
    { user, ... }:
    let
      defaultLocale = "en_US.UTF-8";
      locale = "de_DE.UTF-8";
    in
    {
      nixos =
        { lib, ... }:
        {
          i18n = {
            extraLocales = [
              "${defaultLocale}/UTF-8"
              "${locale}/UTF-8"
            ];
          }
          // lib.mkIf user.isPrimary {
            defaultLocale = defaultLocale;
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
        };
      homeManager = {
        home.language = {
          address = locale;
          base = defaultLocale;
          #collate = locale;
          #ctype = locale;
          measurement = locale;
          #messages = locale;
          monetary = locale;
          name = locale;
          numeric = locale;
          paper = locale;
          telephone = locale;
          time = locale;
        };
      };
    };
}
