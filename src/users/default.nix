{
  lib,
  users,
  ...
}:
let
  allUsers = [
    "gotocoffee"
    "snow_owlia"
  ];
  mainUser = builtins.head users;
in
{
  users = {
    users =
      let
        makeUser = uid: name: {
          ${name} = {
            enable = builtins.elem name users;
            uid = 1000 + uid;
            isNormalUser = true;
            description = name;
            extraGroups = lib.optional (mainUser == name) "wheel";
          };
        };
      in
      lib.mergeAttrsList (lib.lists.imap0 makeUser allUsers);
  };
  imports =
    builtins.map (name: ./${name}) (
      builtins.filter (name: builtins.pathExists ./${name}/default.nix) users
    )
    ++ lib.optional (builtins.pathExists ./${mainUser}/main.nix) ./${mainUser}/main.nix;

  home-manager = lib.mkIf true {
    users =
      let
        makeUser = name: {
          ${name} = {
            imports = lib.optional (builtins.pathExists ./${name}/home/default.nix) ./${name}/home;
          };
        };
      in
      lib.mergeAttrsList (builtins.map makeUser users);
  };
}
