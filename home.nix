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
    };
  };

  home.packages = with pkgs; [
    cowsay
    cmatrix
  ];

  home.stateVersion = "25.11";
}
