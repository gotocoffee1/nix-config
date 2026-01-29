{
  services.pihole-ftl = {
    enable = true;
    lists = [
      {
        url = "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts";
        type = "block";
        enabled = true;
        description = "Steven Black's HOSTS";
      }
    ];
    openFirewallDNS = true;
    openFirewallDHCP = false;
    openFirewallWebserver = true;
    queryLogDeleter.enable = true;
    settings = {
      dns = {
        upstreams = [
          "9.9.9.9"
        ];
      };
    };
  };
  services.pihole-web = {
    enable = true;
    ports = [ 80 ];
  };
}
