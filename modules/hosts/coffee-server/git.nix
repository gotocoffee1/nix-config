{
  role.git = {
    nixos =
      { pkgs, ... }:
      let
        path = "/media/EXTERN_DISK/git";
      in
      {
        users.users.git = {
          isSystemUser = true;
          group = "git";
          home = path;
          createHome = true;
          shell = "${pkgs.git}/bin/git-shell";
          openssh.authorizedKeys.keyFiles = [ ../../users/gotocoffee/keys/id_ed25519.pub ];
        };
        users.groups.git = { };
        services.openssh = {
          enable = true;
          extraConfig = ''
            Match user git
              AllowTcpForwarding no
              AllowAgentForwarding no
              PasswordAuthentication no
              PermitTTY no
              X11Forwarding no
          '';
        };
        services.cgit."default" = {
          enable = true;
          gitHttpBackend.enable = false;
          scanPath = path;
          nginx.virtualHost = "git.*";
        };
        services.nginx = {
          enable = true;
        };
      };
  };
}
