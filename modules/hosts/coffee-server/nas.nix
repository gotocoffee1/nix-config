{
  den.quirks.nasUsers = {
    description = "users that have a nas account";
  };
  role.nas-user = { user, ... }: {
    nasUsers = [ user.userName ];
  };
  role.nas = {
    nixos = { nasUsers, lib, ... }: {
      services.samba =
        let
          users = nasUsers;
          path = "/media/EXTERN_DISK/nas";
          mkShare =
            {
              name,
              user,
              owner,
              group,
              mod,
            }:
            {
              ${name} = {
                "path" = "${path}/${name}";
                "valid users" = user;
                "public" = "no";
                "writeable" = "yes";
                "hide dot files" = "no";
                "force user" = owner;
                "force group" = group;
                "force create mode" = mod;
                "force directory mode" = mod;
                "create mask" = mod;
                "directory mask" = mod;
              };
            };
          mkUserShare =
            name:
            mkShare {
              name = name;
              user = name;
              owner = name;
              group = "root";
              mod = "0750";
            };
          mkSharedDir =
            users:
            mkShare {
              name = "shared";
              user = users;
              owner = "root";
              group = "users";
              mod = "0770";
            };
        in
        {
          enable = users != [ ];
          openFirewall = true;
          settings =

            {
              global = {
                "workgroup" = "WORKGROUP";
                #"netbios name" = "nas";
                "security" = "user";
                "deadtime" = "30";
                "use sendfile" = "yes";
              };
            }
            // mkSharedDir (builtins.concatStringsSep " " users)
            // lib.mergeAttrsList (builtins.map mkUserShare users);
        };
    };
  };
}
