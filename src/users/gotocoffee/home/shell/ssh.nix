{ ... }:
{
  services.ssh-agent = {
    enable = true;
  };
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "vm" = {
        hostname = "localhost";
        port = 2222;
        forwardAgent = true;
        addKeysToAgent = "yes";
      };
      "*" = {
        addKeysToAgent = "yes";
      };
    };
  };
}
