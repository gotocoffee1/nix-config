{
  imports = [
    ./optional/bluetooth.nix
    ./optional/greeter.nix
    ./optional/printer_scanner.nix
    ./specialisations/gui.nix
  ];

  specialisation = {
    headless.configuration = {
      imports = [
        ./specialisations/headless.nix
      ];
    };
  };
  services = {
    kmscon = {
      enable = true;
      useXkbConfig = true;
    };
  };
  # for pipewire
  security.rtkit.enable = true;
}
