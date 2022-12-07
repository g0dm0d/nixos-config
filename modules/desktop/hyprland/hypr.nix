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
  ];

  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
}

