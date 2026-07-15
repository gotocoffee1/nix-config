{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  packages = with pkgs; [
    just
    nixfmt
    nixos-anywhere
    disko
    sops
  ];
}
