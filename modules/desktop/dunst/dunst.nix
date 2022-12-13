{ lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    dunst
  ];

  home.file.".config/dunst/dunstrc".source = ./dunstrc;
  # services.dunst.enable = true;
}
