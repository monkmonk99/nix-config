{ config, lib, pkgs, modulesPath, ... }:

{
programs.hyprland.enable = true;
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
environment.sessionVariables.NIXOS_OZONE_WL = "1";

fonts.packages = with pkgs; [
	(nerdfonts.override { fonts = [ "CodeNewRoman" ]; })
];

  home-manager.users.flynn = { config, pkgs, ... }: {
  	
	xdg.configFile = {
		"waybar" = {
		      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.nix/.config/waybar";
		      recursive = true;
		};
		"hypr" = {
		      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.nix/.config/hypr";
		      recursive = true;
		};
	};
};
}
