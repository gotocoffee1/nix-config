{
  den,
  ...
}:
{
  den.hosts.x86_64-linux.coffee-pot.users = {
    gotocoffee = { };
    snow_owlia = { };
  };
  den.aspects.coffee-pot = {
    includes = [
      den.aspects.common
      den.aspects.core
      den.aspects.desktop
    ];
    nixos = {
      envFeatures = {
        hardware = {
          hasBattery = true;
        };
      };
      imports = [
        ./_disko.nix
        ./_hardware-configuration.nix
      ]
      ++ [
        (import ../../../src/users {
          gotocoffee = {
            profile = "desktop";
            isMainUser = true;
            features = {
              hardware = {
                monitor = [
                  "eDP-1, preferred, auto, 1"
                ];
              };
            };
          };
          snow_owlia = {
            profile = "desktop";
          };
        })
      ];
    };
  };
}
