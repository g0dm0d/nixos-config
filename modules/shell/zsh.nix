{ lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    zsh
    oh-my-zsh
    thefuck
    zsh-syntax-highlighting
    zsh-autosuggestions
    zsh-powerlevel10k
  ];

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
      # theme = "powerlevel10k";
    };
    plugins = [
      {
        name = "powerlevel10k-config";
        src = lib.cleanSource ./.;
        file = "p10k.zsh";
      }
    ];
    # initExtra = ''
    #   PROMPT="%F{blue}%n@%m %~%b "$'\n'"%(?.%F{green}%Bλ%b |.%F{red}✘) %f"
    # '';
  };

  programs.zsh.zplug = {
    enable = true;
    plugins = [
      { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
      { name = "zsh-users/zsh-autosuggestions"; }
      { name = "zsh-users/zsh-syntax-highlighting"; }
    ];
  };
}

