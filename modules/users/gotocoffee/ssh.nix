{
  gtc.ssh-client.homeManager = {
    services.ssh-agent = {
      enable = true;
    };
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      settings = {
        "devel" = {
          hostname = "localhost";
          port = 2222;
          forwardAgent = true;
          strictHostKeyChecking = "accept-new";
          addKeysToAgent = "yes";
        };
        "vm" = {
          hostname = "localhost";
          port = 3333;
          strictHostKeyChecking = "off";
          addKeysToAgent = "yes";
        };
        "*" = {
          addKeysToAgent = "yes";
        };
      };
    };
  };
  gtc.ssh = {
    user = {
      openssh.authorizedKeys.keyFiles = [ ./keys/id_ed25519.pub ];
    };
    nixos = {
      # Enable the OpenSSH daemon.
      services.openssh.enable = true;
    };
  };
}
