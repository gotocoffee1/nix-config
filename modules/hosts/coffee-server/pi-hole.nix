{
  role.pihole.nixos =
    let
      port = 9000;
    in
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
        openFirewallWebserver = false;
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
        ports = [ port ];
      };
      services.nginx = {
        enable = true;
        virtualHosts = {
          "pi-hole.*" = {
            locations."/" = {
              recommendedProxySettings = true;
              proxyPass = "http://127.0.0.1:${toString port}";
            };
          };
        };
      };
    };
}
