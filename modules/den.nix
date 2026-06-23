{ inputs, ... }: {
  imports = [ inputs.den.flakeModule ];
  perSystem = { pkgs, ... }: {
    devShells.default = import ../shell.nix { inherit pkgs; };
  };
}
