{ pkgs, ... }:
{
  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep ];
  };
  home.shellAliases = {
    cat = "bat";
    diff = "batdiff";
  };
  programs.fish.interactiveShellInit = "batman --export-env | source";
}

