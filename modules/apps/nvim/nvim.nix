{ lib, pkgs, ... }:

{
	home.packages = with pkgs; [
	  neovim
	  cargo
	  rustc
	  gcc
	];
    
	home.file.".config/nvim" = {
		source = ./nvim;
		recursive = true;
	};
}
