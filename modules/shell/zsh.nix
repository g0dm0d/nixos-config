{ lib, pkgs, ... }:

{
  home.packages = with pkgs; [
	  zsh
    oh-my-zsh
    zsh-syntax-highlighting
    zsh-autosuggestions
  ];
    
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "intheloop";
    };
    initExtra = ''
        PROMPT="%F{blue}%n@%m %~%b "$'\n'"%(?.%F{green}%Bλ%b |.%F{red}✘) %f"
    '';
  };
}