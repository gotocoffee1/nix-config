{ gtc, ... }:
{
  den.hosts.x86_64-linux.coffee-grinder = {
    users.gotocoffee = {
      isPrimary = true;
    };
  };

  den.aspects.coffee-grinder = {
    provides.gotocoffee = {
      includes = [
        gtc.devel
      ];
    };
    includes = [
    ];
    nixos = {
      virtualisation.vmVariant = {
        virtualisation = {
          memorySize = 8 * 1024;
          diskSize = 100 * 1024;
          cores = 4;
          writableStoreUseTmpfs = false;
          graphics = false;
          forwardPorts = [
            {
              from = "host";
              host.port = 2222;
              guest.port = 22;
            }
          ];
          sharedDirectories = {
            devel = {
              source = "/home/gotocoffee/Projects";
              target = "/home/gotocoffee/Projects";
            };
          };
        };
      };
    };
  };
}
