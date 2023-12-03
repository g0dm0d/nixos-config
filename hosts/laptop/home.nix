{ config, lib, pkgs, username, ... }:

{
  imports =
    (import ../../modules/apps) ++
    (import ../../modules/desktop) ++
    (import ../../modules/shell);

  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "23.05";

  home.packages = with pkgs; [
    # Media
    vlc
    feh
    spotify
    obs-studio
    flameshot
    cinnamon.nemo

    #Internet
    firefox

    # Cli apps
    btop
    neofetch
    nettools

    # Work
    vscode
    onlyoffice-bin
    obsidian

    # Social
    discord
    tdesktop

    #Terminal emulators
    alacritty

    # Tweaks
    gnome.gnome-tweaks
    brightnessctl
    xdg-desktop-portal-gnome
    sassc
    glib

    # Programming stuff
    dbeaver
    unityhub
    postgresql
    insomnia
    sqlitebrowser
    sqlite
    jetbrains.goland
    go-migrate
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
