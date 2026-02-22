{
  lib,
  users,
  ...
}:
let
  mainUser = builtins.head users;
in
{

  imports = lib.optional (builtins.pathExists ./${mainUser}/main.nix) ./${mainUser}/main.nix;
  home-manager = {
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
