{ config, lib, pkgs, modulesPath, ... }:

{

services.xserver = {
	windowManager.i3 = {
		enable = true;
	};
};
environment.systemPackages = with pkgs; [
	polybarFull
	rofi
	dunst
	feh
	picom
	i3lock-color
	lxappearance
	xss-lock
	pulseaudio
	networkmanagerapplet
	xclip
	dunst
	picom
	pywal

];

fonts.packages = with pkgs; [
	(nerdfonts.override { fonts = [ "CodeNewRoman" ]; })
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
		"polybar" = {
		      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.nix/.config/polybar";
		      recursive = true;
		};
		"rofi" = {
		      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.nix/.config/rofi";
		      recursive = true;
		};
	};
};
}
