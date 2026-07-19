{
  role.mealie.nixos =
    { config, ... }:
    let
      port = 9001;
    in
    {
      services.mealie = {
        enable = true;
        port = port;
      };
      services.nginx = {
        enable = true;
        virtualHosts = {
          "mealie.*" = {
            locations."/" = {
              recommendedProxySettings = true;
              proxyPass = "http://127.0.0.1:${toString port}";
            };
          };
        };
      };
    };
}
