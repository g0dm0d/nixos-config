{ config, pkgs, username, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi"; # ← use the same mount point here.
    };
    grub = {
      efiSupport = true;
      #efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
      device = "nodev";
      useOSProber = true;
    };
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
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

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.i3.enable = true;
  services.xserver.windowManager.i3.enable = true;

  # environment.variables.NIXOS_OZONE_WL = "1";

  # Configure keymap in X11
  services.xserver = {
    layout = "us,ru";
    xkbVariant = "";
    xkbOptions = "grp:alt_shift_toggle";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput = {
    enable = true;

    # disabling mouse acceleration
    mouse = {
      accelProfile = "flat";
    };

    # disabling touchpad acceleration
    # touchpad = {
    #   accelProfile = "flat";
    # };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };

  # Add fonts in system
  fonts.fontconfig.enable = true;
  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts

    fira-code
    jetbrains-mono
    nerdfonts
    (nerdfonts.override { fonts = [ "JetBrainsMono" "FiraCode" ]; })

    # for latex
    libertine

    nerdfonts

    unifont
    symbola
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #network
    wget

    #Text editor
    vim
    xclip

    #Archivs
    unzip
    zip
    unrar

    # tools
    docker
    docker-compose
    rustup
    go
    gopls
    gcc
    nodejs
    python310Full
    python310Packages.pip

    texlive.combined.scheme-medium

    grub2

    gnumake
    pkg-config
    xorg.libXft
    xorg.libXinerama
    xorg.libX11
    gtk3
    gtk3-x11
  ];

  # Docker
  boot.kernelModules = [ "kvm-amd" "kvm-intel" ];

  boot.supportedFilesystems = [ "ntfs" ];

  virtualisation.libvirtd.enable = true;
  virtualisation.docker.enable = true;

  # Android emulator
  # virtualisation.waydroid.enable = true;
  # virtualisation.lxd.enable = true;

  system.stateVersion = "23.05"; # Did you read the comment?

  # Personal tweaks
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Enable Flake
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };
}
