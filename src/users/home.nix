{
  lib,
  users,
  ...
}:
let
  mainUser = builtins.head users;
in
{

  imports =
    (lib.optional (builtins.pathExists ./${mainUser}/main.nix) ./${mainUser}/main.nix)
    ++ builtins.map (name: ../extra/users/${name}) (
      builtins.filter (name: builtins.pathExists ../extra/users/${name}/default.nix) users
    );
  home-manager = {
    users =
      let
        makeUser = name: {
          ${name} = {
            imports =
              lib.optional (builtins.pathExists ./${name}/home/default.nix) ./${name}/home
              ++ lib.optional (builtins.pathExists ../extra/users/${name}/home/default.nix) ../extra/users/${name}/home;
          };
        };
      in
      lib.mergeAttrsList (builtins.map makeUser users);
  };
}
