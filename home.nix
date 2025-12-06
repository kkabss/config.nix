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
      config = "sudo vim /etc/nixos/";
    };
  };

    imports = [
       ./modules/alacritty.nix
  ];  

  home.packages = with pkgs; [
    cowsay
    cmatrix
  ];

  home.stateVersion = "25.11";
}
