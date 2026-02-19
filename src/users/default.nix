{ config, lib, ... }:
let
  features = config.envFeatures;
  users = [
    "gotocoffee"
    "snow_owlia"
  ];
  mainUser = builtins.head features.users;
in
{
  users = {
    users =
      let
        makeUser = uid: name: {
          ${name} = {
            enable = builtins.elem name features.users;
            uid = 1000 + uid;
            isNormalUser = true;
            description = name;
            extraGroups = lib.optional (mainUser == name) "wheel";
          };
        };
      in
      lib.mergeAttrsList (lib.lists.imap0 makeUser users);
  };
  imports = builtins.map (name: ./${name}) (
    builtins.filter (name: builtins.pathExists ./${name}/default.nix) users
  );

  home-manager = lib.mkIf true {
    users =
      let
        makeUser = name: {
          ${name} = {
            imports = lib.optional (builtins.pathExists ./${name}/home/default.nix) ./${name}/home;
          };
        };
      in
      lib.mergeAttrsList (builtins.map makeUser features.users);
  };
}
