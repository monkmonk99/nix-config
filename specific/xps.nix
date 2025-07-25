
{ config, lib, pkgs, modulesPath, ... }:

{

  environment.systemPackages = with pkgs; [
  ];

services.xserver.dpi = 192;
services.libinput = {
	enable = true;
	touchpad = {
		accelSpeed = "0.3";
    naturalScrolling = true;
	};
};
environment.variables = {
    GDK_SCALE = "1";
    GDK_DPI_SCALE = "0.5";
    _JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
  };
home-manager.users.flynn = { config, pkgs, ... }: {
	programs.rofi.extraConfig = {
		dpi = "235";
	};
	#monitor configuration
	services.autorandr.enable = true;
	programs.autorandr = {
		enable = true;
		profiles = {
			"default" = {
				fingerprint = {
					eDP-1 = "00ffffffffffff0006af2b2800000000001c0104a51d117802ee95a3544c99260f50540000000101010101010101010101010101010152d000a0f0703e803020350025a51000001a000000000000000000000000000000000000000000fe0039304e544880423133335a414e0000000000024103a8011100000b010a20200006";
				};
				config = {
					eDP-1 = {
						enable = true;
						mode = "3840x2160";
						rate = "60.00";
						primary = true;
						position = "0x0";
						dpi = 235;
            scale = {
              method = "factor";
              x = 2.0;
              y = 2.0;
            };
					};
				};
			};
		};
	};
	
};

# makes the laptop work with displaylink usb hubs
services.xserver.videoDrivers = [ "displaylink" "modesetting" ];

}
