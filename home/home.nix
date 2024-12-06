{...}:
{
  home.stateVersion = "24.11";
  imports = [
    ./editor/neovim.nix
    ./gui/app_launcher/fuzzel.nix
    ./gui/bar/waybar.nix
    ./gui/terminal/kitty.nix
    ./gui/wallpaper/wpaperd.nix
    #./gui/window_manager/sway/sway.nix
    ./gui/window_manager/hypr/hyprland.nix
    ./shell/zsh.nix
    ./tools/direnv.nix
    ./vcs/git.nix
  ];
}

