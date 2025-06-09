{ config, lib, pkgs, modulesPath, ... }:

{

environment.systemPackages = with pkgs; [
  killall
];
programs.zsh.enable = true; #not sure if this is necessary
home-manager.users.flynn = {
   programs.zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
    
      shellAliases = {
        ll = "ls -l";
        update = "sudo nixos-rebuild switch";
        cd="z";
        picomoff="killall picom";
      };
      history.size = 10000;

      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "thefuck" "sudo"];
        theme = "agnoster";
	extraConfig = "
		typeset -A ZSH_HIGHLIGHT_STYLES
		ZSH_HIGHLIGHT_STYLES[comment]='fg=magenta'
	";
      };
    };

    programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    };

    programs.thefuck.enable = true;
};
}
