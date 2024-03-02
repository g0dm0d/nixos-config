{ lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    git
  ];

  programs.git = {
    enable = true;
    userName = "Ivan Berlin";
    userEmail = "ivan.berlin06@gmail.com";
  };
}
