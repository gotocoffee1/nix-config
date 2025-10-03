{ config, pkgs, ... }:
let
  nvimConfig = builtins.fetchTarball "https://github.com/gotocoffee1/kickstart.nvim/archive/85c45df7cbb122364f73dfe46d46174620789337.zip";
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
      ++ [
        nixfmt-rfc-style
        prettierd
      ];
  };
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink (
    if builtins.pathExists (./nvim) then ./nvim else nvimConfig
  );
}
