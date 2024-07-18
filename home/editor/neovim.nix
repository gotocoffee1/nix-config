{config, pkgs, ...}:
let
nvimConfig = pkgs.fetchFromGitHub {
  owner = "gotocoffee1";
  repo = "kickstart.nvim";
  rev = "10a6b394ca900d7c87131f5eae3a2639c0758fb9";
  sha256 = "G/a7HH8wN9RAHUCSojKDyiySy/mbPJXgecKC9vIgHFI=";
};
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    #extraLuaConfdig = 
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
