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
    wl-clipboard #for neovim wayland only
    rofi-wayland # wayland only
    hyprpaper #wallpaper software
    zoxide
    nwg-look #for setting the cursor as recommended by hyprland
    pywal16
    brightnessctl
    hyprcursor
    hyprsunset
    hyprlock
    hypridle
  ];
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  fonts.packages = [
    pkgs.nerd-fonts.code-new-roman
  ];
  
  home-manager.users.flynn = { config, pkgs, ... }: {
    home.pointerCursor = {
      gtk.enable = true;
      #x11.enable = true;
      package = pkgs.phinger-cursors;
      name = "phinger-cursors-dark";
      size = 28;
    };
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
