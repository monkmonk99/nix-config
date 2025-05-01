{ config, lib, pkgs, modulesPath, ... }:

{
environment.systemPackages = with pkgs; [
	waybar
	hyprpicker
	pywal
	blueman
	bluez
	networkmanager
	swaynotificationcenter #wayland specific
	nerdfonts
];

fonts.packages = with pkgs; [
	(nerdfonts.override { fonts = [ "CodeNewRoman" ]; })
];

  home-manager.users.flynn = { config, pkgs, ... }: {
  	
	xdg.configFile = {
		"waybar" = {
		      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.nix/.config/waybar";
		      recursive = true;
		};
	};
};
}
