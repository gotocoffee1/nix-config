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

  imports = builtins.map (name: ./${name}) (
    builtins.filter (name: builtins.pathExists ./${name}/default.nix) users
  );
}
