{
  inputs,
  den,
  gtc,
  ...
}:
{
  imports = [ (inputs.den.namespace "gtc" false) ];
  den.aspects.gotocoffee = { ... }: {
    includes = [
      gtc.core
      gtc.locale
      gtc.ssh
    ];
  };
  gtc.ssh = {
    user = {
      openssh.authorizedKeys.keyFiles = [ ./keys/id_ed25519.pub ];
    };
    nixos = {
      # Enable the OpenSSH daemon.
      services.openssh.enable = true;
    };
  };
  gtc.core =
    { user, ... }:
    {
      includes = [
        den.batteries.define-user
        (den.batteries.user-shell "fish")
      ];
      user = { lib, ... }: {
        uid = 1000;
        extraGroups = [
          "networkmanager"
        ]
        ++ lib.optional user.isPrimary "wheel";
      };

    };
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
              "de_DE.UTF-8/UTF-8"
              "en_US.UTF-8/UTF-8"
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
