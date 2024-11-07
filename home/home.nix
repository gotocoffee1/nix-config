{...}:
{
  home.stateVersion = "24.05";
  imports = [
    ./editor/neovim.nix
    ./gui/app_launcher/fuzzel.nix
    ./gui/bar/waybar.nix
    ./gui/window_manager/hypr/hyprland.nix
    ./gui/terminal/kitty.nix
    ./shell/zsh.nix
    ./tools/direnv.nix
    ./vcs/git.nix
  ];
}

