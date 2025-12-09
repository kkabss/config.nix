# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:
 
  {
  imports =
    [ 
	./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "America/Recife";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };
  
  # Enable Nix-garbage-collection.
  nix.gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 3d";
    };

  services.xserver = { 
  enable = true;
  desktopManager.xfce.enable = true;
  displayManager.lightdm.enable = true;
  videoDrivers = [ "intel" ];
  displayManager.lightdm.greeters.gtk = {
  enable = true;
  theme = {
    name = "Adwaita-dark";
  };
  extraConfig = ''
    background = "/etc/nixos/wallpapers/ig636-wallpaper.cam.png";
  '';
 };
  xkb = {
    layout = "br";
    variant = "";
    };
  };
 
  powerManagement.cpuFreqGovernor = "performance";

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  console.keyMap = "br-abnt2";

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
   };

   users.users.kabs = {
    isNormalUser = true;
    # shell = pkgs.fish;
    description = "kabs";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
     chromium 
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
   wget
   git
   curl
   fastfetch
   tealdeer
   xclip
   bat
   zip
   unzip

   hyprpaper
   waybar
   alacritty
   neovim
   rofi
  ];

  # List services that you want to enable:

  programs.steam.enable = true;
  programs.gamemode.enable = true;

  fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
  ];
  
  # programs.fish.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
 }
