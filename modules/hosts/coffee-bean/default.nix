{
  role,
  gtc,
  ...
}:
{
  den.hosts.x86_64-linux.coffee-bean.users = {
    gotocoffee = {
      isPrimary = true;
    };
  };
  den.aspects.coffee-bean = {
    provides.gotocoffee = {
      includes = [
        gtc.desktop
      ];
    };
    includes = [
      role.desktop
    ];
    nixos = {
      imports = [
        ./_disko.nix
        ./_hardware-configuration.nix
      ];
    };
  };
}
