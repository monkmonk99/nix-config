{ config, lib, pkgs, modulesPath, ... }:

{

environment.systemPackages = with pkgs; [
	kitty
];

home-manager.users.flynn = { config, pkgs, ... }: {
	xdg.configFile = {
		"kitty" = {
		      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.nix/.config/kitty";
		      recursive = true;
		};
	};
};
}
