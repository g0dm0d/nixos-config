{ config, lib, pkgs, ... }:

{
  imports = [
    ../waybar/waybar.nix
    ../wofi/wofi.nix
  ];

  home.packages = with pkgs; [
    grim
    slurp
    swappy
    wl-clipboard
    wlr-randr
    hyprpaper
    hyprland
  ];

  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
  home.file.".config/hypr/hyprpaper.conf".source = ./hyprpaper.conf;
  home.file.".config/hypr/wallpaper.png".source = ./wallpaper.png;
}