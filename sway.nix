{ config, lib, pkgs, modulesPath, ... }:

{
environment.systemPackages = with pkgs; [
    grim # screenshot functionality
    slurp # screenshot functionality
    wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
    mako # notification system developed by swaywm maintainer
];
services.gnome.gnome-keyring.enable = true;

#enabling outside home-manager to give display managers access
programs.sway.enable = true; 

home-manager.users.flynn = {
	wayland.windowManager.sway = {
	  wrapperFeatures.gtk = true;
	  config = rec {
	  modifier = "Mod4";
	  terminal = "kitty";
	  startup = [
	  ];
	  };
        };
};
}
