users:
{
  lib,
  ...
}:
let
  hasImport =
    path:
    let
      p = if builtins.readFileType path == "directory" then lib.path.append path "default.nix" else path;
    in
    builtins.pathExists p;
  optionalImport = path: cfg: lib.optional (hasImport path) (import path cfg);
in
{
  users = {
    mutableUsers = false;
    users =
      let
        makeUser = name: cfg: {
          isNormalUser = true;
          description = name;
        };
      in
      lib.mapAttrs makeUser users;
  };

  imports = builtins.concatLists (
    builtins.attrValues (
      lib.mapAttrs (
        name: cfg:
        (optionalImport ./${name} cfg)
        ++ (lib.optionals (!(cfg ? enableExtra) || cfg.enableExtra) (
          optionalImport ../extra/users/${name} cfg
        ))
        ++ (lib.optionals (cfg ? isMainUser && cfg.isMainUser) (optionalImport ./${name}/main.nix cfg))
      ) users
    )
  );

  home-manager = {
    users =
      let
        makeUser = name: cfg: {
          imports =
            [ ]
            ++ (optionalImport ./${name}/home cfg)
            ++ (lib.optionals (!(cfg ? enableExtra) || cfg.enableExtra) (
              optionalImport ../extra/users/${name}/home cfg
            ));
        };
      in
      lib.mapAttrs makeUser users;
  };
}
