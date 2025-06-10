{ config, lib, pkgs, modulesPath, ... }:

{
environment.sessionVariables.EDITOR = "nvim";#not sure this is necessary
home-manager.users.flynn = {
	programs.neovim = {
	  enable = true;
	  defaultEditor = true;
	  extraConfig = ''
	    set number relativenumber
	    set tabstop=2 softtabstop=2 shiftwidth=2
	    set expandtab
	  '';
	};	
};
}
