{
  den,
  ...
}:
{
  den.hosts.x86_64-linux.coffee-bean.users = {
    gotocoffee = { };
  };
  den.aspects.coffee-bean = {
    includes = [
      den.aspects.common
      den.aspects.core
      den.aspects.desktop
    ];
    nixos = {
      imports = [
        ./_disko.nix
        ./_hardware-configuration.nix
      ]
      ++ [
        (import ../../users {
          gotocoffee = {
            profile = "desktop";
            isMainUser = true;
            features = { };
          };
        })
      ];
    };
  };
}
