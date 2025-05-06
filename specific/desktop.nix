
{ config, lib, pkgs, modulesPath, ... }:

{

  environment.systemPackages = with pkgs; [
  ];


  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    open = false;

    # Enable the Nvidia settings menu,
	# accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

home-manager.users.flynn = { config, pkgs, ... }: {
	#monitor configuration
	services.autorandr.enable = true;
	programs.autorandr = {
		enable = true;
		profiles ={
			"default" = {
				fingerprint = {
					DP-0 = "00ffffffffffff0005e30224652d0000241f0104a5351e783b0a85aa4f46ab270d5054bfef00d1c081803168317c4568457c6168617c023a801871382d40582c45000f282100001e000000ff0041544e4d393141303131363231000000fc0032344732573147340a20202020000000fd003090a0a021010a2020202020200108020327f14c0103051404131f120211903f23090707830100006d1a000002013090000000000000377f808870381440182035000f282100001e866f80a070384040302035000f282100001efe5b80a070383540302035000f282100001e2a4480a070382740302035000f282100001a000000000000000000000000000000004e";
					DP-4 = "00ffffffffffff0010acc4a142355532281f0104a5351e783a5625ab534f9d25105054a54b00714f8180a9c0d1c081c081cf01010101023a801871382d40582c45000f282100001e000000ff00354d4e4e394a330a2020202020000000fc0044454c4c205032343232480a20000000fd00384c1e5311010a2020202020200036";
				};
				config = {
					DP-0 = {
						enable = true;
						mode = "1920x1080";
						rate = "144.00";
						primary = true;
						position = "0x0";
					};
					DP-4 = {
						enable = true;
						mode = "1920x1080";
						rate = "60.00";
						primary = false;
						position = "1920x0";
					};
				};
			};
		};
	};
	
};
}
