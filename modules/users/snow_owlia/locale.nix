{
  so.locale =
    { user, ... }:
    let
      defaultLocale = "de_DE.UTF-8";
    in
    {
      nixos =
        { lib, ... }:
        {
          i18n = {
            extraLocales = [
              "${defaultLocale}/UTF-8"
            ];
          }

          // lib.mkIf user.isPrimary {
            defaultLocale = defaultLocale;
          };
        };
      homeManager = {
        home.language = {
          base = defaultLocale;
          ctype = defaultLocale;
          numeric = defaultLocale;
          time = defaultLocale;
          collate = defaultLocale;
          monetary = defaultLocale;
          messages = defaultLocale;
          paper = defaultLocale;
          name = defaultLocale;
          address = defaultLocale;
          telephone = defaultLocale;
          measurement = defaultLocale;

        };
      };
    };
}
