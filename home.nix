{ config, pkgs, ... }:

  {
  home.username = "kabs";
  home.homeDirectory = "/home/kabs";

  programs.home-manager.enable = true;

  programs.bash = {
    enable = true;
    shellAliases = {
      ff = "fastfetch";
      rebuild = "sudo nixos-rebuild switch";
      rebuildup = "sudo nixos-rebuild switch --upgrade";
      updategit = "sudo cp -rf /etc/nixos/* /home/kabs/nixconfig/; cd /home/kabs/nixconfig; git add .; git commit -ma; git push kabs main";
      config = "sudo -E nvim /etc/nixos/";
      sudo = "sudo -E";
    };
  };

    imports = [
     ./modules/theme.nix 
  ];

  home.file.".config/nvim".source = ./config/nvim;
  home.file.".config/alacritty".source = ./config/alacritty;
  home.file.".config/hypr".source = ./config/hyprland;
  home.file.".config/rofi".source = ./config/rofi;
  home.file.".config/waybar".source = ./config/waybar;

  home.packages = with pkgs; [
    cowsay
    cmatrix
   
    #nvim files
    neovim
    ripgrep
    nil 
    nixpkgs-fmt
    nodejs
    gcc
  ];

  home.stateVersion = "25.11";
}
