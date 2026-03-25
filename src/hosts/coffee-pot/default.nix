{
  envFeatures = {
    gui = {
      monitor = [
        "eDP-1, preferred, auto, 1"
      ];
    };
  };
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
      };
      snow_owlia = {
        profile = "desktop";
      };
    })
  ];
}
