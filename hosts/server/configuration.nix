{ config, pkgs, username, ... }:

{
  networking.hostName = "nixos"; # Define your hostname.
  networking.wireless.enable = true; # Enables wireless support via wpa_supplicant.

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Moscow";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };

  nixpkgs.config.allowUnfree = true;

  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    git

    docker
    docker-compose
    rustc
    cargo
    rustup
    rustfmt
    go
    gopls
    gcc
    nodejs

    gnumake
    pkg-config
  ];

  # Docker
  # boot.kernelModules = [ "kvm-amd" "kvm-intel" ];

  virtualisation.libvirtd.enable = true;
  virtualisation.docker.enable = true;

  system.stateVersion = "23.05";

  # Personal tweaks
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Enable Flake
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };
}
