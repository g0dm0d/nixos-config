{ lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    wofi
  ];

  home.file.".config/wofi" = {
    source = ./wofi;
    recursive = true;
  };
  home.file.".config/wofi/wofi-wifi-menu.sh" = {
    source = ./wofi/wofi-wifi-menu.sh;
    executable = true;
  };
}
