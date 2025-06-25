{ config, lib, pkgs, modulesPath, ... }:

{
services.displayManager.defaultSession = "hyprland";
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
	wl-clipboard #for neovim wayland only
	rofi-wayland # wayland only
	hyprpaper #wallpaper software
	zoxide
	nwg-look #for setting the cursor as recommended by hyprland
	pywal16
  brightnessctl
];
environment.sessionVariables.NIXOS_OZONE_WL = "1";

fonts.packages = with pkgs; [
	(nerdfonts.override { fonts = [ "CodeNewRoman" ]; })
];

  home-manager.users.flynn = { config, pkgs, ... }: {
  	
	xdg.configFile = {
		"waybar" = {
		      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.nix/config/waybar";
		      recursive = true;
		};
		"hypr" = {
		      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.nix/config/hypr";
		      recursive = true;
		};
	};
};
}
