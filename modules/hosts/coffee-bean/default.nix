{
  den,
  ...
}:
{
  den.hosts.x86_64-linux.coffee-bean.users = {
    gotocoffee = {
      isPrimary = true;
    };
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
      ];
    };
  };
}
