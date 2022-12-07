{ config, lib, pkgs, ... }:

{
  imports =
    (import ../waybar/waybar.nix) ++
    (import ../wofi/wofi.nix);

  home.packages = with pkgs; [
    grim
    slurp
    swappy
    wl-clipboard
    wlr-randr
  ];

  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
}

