{ config, lib, pkgs, modulesPath, ... }:

{

  environment.systemPackages = with pkgs; [
	# common prereqs for nvim distros
	ripgrep
	fd
  unzip
  ];
  environment.sessionVariables.EDITOR = "nvim";#not sure this is necessary
  home-manager.users.flynn = { config, pkgs, ... }: {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      #extraConfig = ''
      #  set number relativenumber
      #  set tabstop=2 softtabstop=2 shiftwidth=2
      #  set expandtab
      #'';
    };  
    xdg.configFile = {
      "nvim" = {
            source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.nix/config/nvim";
            recursive = true;
      };
    };
  };
}
