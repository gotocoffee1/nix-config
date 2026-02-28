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
        hasHome = name: builtins.pathExists ./${name}/home/default.nix;
        hasExtraHome = name: builtins.pathExists ../extra/users/${name}/home/default.nix;
        makeUser = name: {
          ${name} = {
            imports =
              lib.optional (hasHome name) ./${name}/home
              ++ lib.optional (hasExtraHome name) ../extra/users/${name}/home;
          };
        };
      in
      lib.mergeAttrsList (
        builtins.map makeUser (builtins.filter (name: (hasHome name) || (hasExtraHome name)) users)
      );
  };
}
