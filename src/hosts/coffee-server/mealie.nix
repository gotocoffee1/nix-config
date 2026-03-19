{ config, ... }:
{
  networking.firewall = {
    allowedTCPPorts = [
      config.services.mealie.port
    ];
  };
  services.mealie = {
    enable = true;
    port = 9001;
  };
}
