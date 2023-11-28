{ config, lib, pkgs, username, ... }:

{
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "23.05";

  home.packages = with pkgs; [
    btop
    nettools

    go-migrate
  ];

  programs.home-manager.enable = true;
}
