{ config, lib, pkgs, modulesPath, ... }:

{
services.displayManager.defaultSession = "none+i3";
services.xserver = {
	desktopManager = {
		xterm.enable = false;
	};
	windowManager.i3 = {
		enable = true;
	};
};
environment.systemPackages = with pkgs; [
	rofi
	dunst
	feh
	i3lock-color
	lxappearance
	xss-lock
	pulseaudio
	networkmanagerapplet
  playerctl
	xclip
  picom
  pywal16
  fastfetch
  vimix-cursors
];


  fonts.packages = [
    pkgs.nerd-fonts.code-new-roman
  ];

#Key todos here are 
#install dunst, nm-applet, feh, maybe picom, xrandr, i3lock-color
# theming can be done with materia-gtk-theme and maybe papirus-icon-theme although maybe theres
# a nerdfonts alternative. lxappearance is recommended for changing the theme but a cli way would
# be better to me
# also a package update indicator would be good imo
home-manager.users.flynn = { config, pkgs, ... }: {
	xdg.configFile = {
		"i3" = {
		      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.nix/config/i3";
		      recursive = true;
		};
		"rofi" = {
		      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.nix/config/rofi";
		      recursive = true;
		};
#		"wallust" = {
#		      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.nix/config/wallust";
#		      recursive = true;
#		};
#		"picom" = {
#		      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.nix/config/picom";
#		      recursive = true;
#		};
	};
};

 # Rerun pywal
 services.xserver.displayManager.sessionCommands = ''
    wal -R &
 '';
 }
