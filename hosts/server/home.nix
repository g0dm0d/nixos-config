{ config, lib, pkgs, username, ... }:

{
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "22.11";

  home.packages = with pkgs; [
    # Shell
    zsh

    # Cli apps
    btop
    neovim
    nettools
    ranger

    # Programming
    go
    python310Full
    postgresql
    docker
    docker-compose
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
