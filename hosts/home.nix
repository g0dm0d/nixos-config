{ config, lib, pkgs, user, ... }:

{
  imports = 
    (import ../modules/apps) ++
    (import ../modules/shell);

  home.username = "godmod";
  home.homeDirectory = "/home/godmod";

  home.packages = with pkgs; [
    # Shell
    #zsh

    # Media
    vlc
    feh
    spotify

    #Internet
    firefox

    # Cli apps
    btop
    #zathura
    neovim
    neofetch
    nettools
    ranger

    # Work
    vscode
    onlyoffice-bin

    # Social
    discord
    tdesktop

    #Terminal emulators
    #kitty
    alacritty

    # Tweaks
    gnome.gnome-tweaks

    # Program language
    go
    python310Full
  ];

  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Setup theme
  #gtk = {
  #  enable = true;
  #  iconTheme = {
  #    name = "Papirus-Dark";
  #    package = pkgs.papirus-icon-theme;
  #  };
  #};
}
