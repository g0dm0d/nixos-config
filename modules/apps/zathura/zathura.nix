{ lib, pkgs, ... }:



{
	home.packages = with pkgs; [
	  zathura
	];
    
    home.file.".config/zathura/zathurarc".source = ./zathurarc;
}

