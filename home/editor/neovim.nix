{config, pkgs, ...}:
let
nvimConfig = pkgs.fetchFromGitHub {
  owner = "gotocoffee1";
  repo = "kickstart.nvim";
  rev = "561bdef90f188d9f456cd2f6fce95ccb534f3bee";
  sha256 = "q2pZzCUUcVdf3CDEzUiAsdLqXZmBE3GmtQiQ30Ye8uY=";
};
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
