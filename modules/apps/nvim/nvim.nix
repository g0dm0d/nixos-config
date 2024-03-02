{ lib, pkgs, ... }:

{
	home.packages = with pkgs; [
	  neovim
	];
    
	home.file.".config/nvim" = {
		source = ./nvim;
		recursive = true;
	};

	home.file.".config/nvim/lua/user" = {
		source = ./astronvim_config;
		recursive = true;
	};
}
