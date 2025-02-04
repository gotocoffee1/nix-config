{ config, pkgs, ... }:
let
  nvimConfig = builtins.fetchTarball "https://github.com/gotocoffee1/kickstart.nvim/archive/7d0154565804452e39c39a1798c6cb71ee0b7bd4.zip";
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraPackages =
      with pkgs;
      [
        wl-clipboard
        git
        ripgrep
        fd
        unzip
        gcc
      ]
      ++ [ nixfmt-rfc-style ];
  };
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink (
    if builtins.pathExists (./nvim) then ./nvim else nvimConfig
  );
}
