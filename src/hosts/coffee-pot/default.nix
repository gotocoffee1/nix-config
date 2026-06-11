{
  envFeatures = {
    hardware = {
      hasBattery = true;
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
}
