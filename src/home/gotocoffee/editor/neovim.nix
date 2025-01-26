{config, pkgs, ...}:
let
nvimConfig = builtins.fetchTarball https://github.com/gotocoffee1/kickstart.nvim/archive/7d0154565804452e39c39a1798c6cb71ee0b7bd4.zip;
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraPackages = [
      pkgs.wl-clipboard
      pkgs.git
      pkgs.ripgrep
      pkgs.unzip
      pkgs.gcc
    ];
  };
  home.file."${config.xdg.configHome}/nvim".source = config.lib.file.mkOutOfStoreSymlink nvimConfig;
}
