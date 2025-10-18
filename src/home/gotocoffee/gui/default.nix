{ lib, ... }:
{
  imports = [
    #./app_launcher/fuzzel.nix
    #./bar/waybar.nix
    #./cursor/cursor.nix
    ./caelestia
    #./notification/dunst.nix
    ./office
    ./terminal/kitty.nix
    #./wallpaper/wpaperd.nix
    #./window_manager/sway/sway.nix
    ./window_manager/hypr/hyprland.nix
  ];
}
