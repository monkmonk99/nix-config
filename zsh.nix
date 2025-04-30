{ config, lib, pkgs, modulesPath, ... }:

{
home-manager.users.flynn = {
   programs.zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
    
      shellAliases = {
        ll = "ls -l";
        update = "sudo nixos-rebuild -I nixos-config=/home/flynn/.nix/configuration.nix switch";
	cd="z";
      };
      history.size = 10000;

      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "thefuck" ];
        theme = "agnoster";
      };
    };

    programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    };
};
}
