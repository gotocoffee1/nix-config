{
  imports = [
    ../../common.nix
    ../../core.nix
    ../../desktop.nix
    ./disko.nix
    ./hardware-configuration.nix
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
}
