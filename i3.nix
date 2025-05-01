{ config, lib, pkgs, modulesPath, ... }:

{

services.xserver = {
	windowManager.i3 = {
		enable = true;
	};
};
environment.systemPackages = with pkgs; [
	rofi
	dunst
	feh
	picom
	polybar
	i3lock-color
	lxappearance
];

#Key todos here are 
#install dunst, nm-applet, feh, maybe picom, polybar, xrandr, i3lock-color
# theming can be done with materia-gtk-theme and maybe papirus-icon-theme although maybe theres
# a nerdfonts alternative. lxappearance is recommended for changing the theme but a cli way would
# be better to me
# also a package update indicator would be good imo
  home-manager.users.flynn = { config, pkgs, ... }: {
  	
	xdg.configFile = {
		"i3" = {
		      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.nix/.config/i3";
		      recursive = true;
		};
	};
};
}
