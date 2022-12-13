{ config, lib, pkgs, username, ... }:

{
  imports =
    (import ../modules/apps) ++
    (import ../modules/desktop) ++
    (import ../modules/shell);

  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "22.11";

  home.packages = with pkgs; [
    # Shell
    #zsh

    # Media
    vlc
    feh
    spotify
    obs-studio

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
    brightnessctl

    # Program language
    go
    python310Full
  ];

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
