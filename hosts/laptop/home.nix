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
    neovim
    neofetch
    nettools

    # Work
    vscode
    onlyoffice-bin
    obsidian

    # Social
    discord
    tdesktop
    endeavour

    #Terminal emulators
    #kitty
    alacritty

    # Tweaks
    gnome.gnome-tweaks
    brightnessctl
    xdg-desktop-portal-gnome
    sassc
    glib

    # Programming
    python310Full
    python310Packages.pip

    dbeaver
    postgresql
    insomnia
    docker
    docker-compose
    sqlitebrowser
    sqlite
    jetbrains.goland
    go-migrate

    # Rust
    cargo-tauri
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
