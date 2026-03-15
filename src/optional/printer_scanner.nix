{ pkgs, ... }:
{
  # printer
  services = {
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    printing = {
      enable = true;
      drivers = with pkgs; [
        cups-filters
        cups-browsed
      ];
    };
  };
  # scanner
  hardware = {
    sane = {
      enable = true;
    };
  };
}
