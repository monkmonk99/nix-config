{ config, lib, pkgs, modulesPath, ... }:
{
  users.users.flynn = {
    extraGroups = ["audio"];
    shell = pkgs.zsh;
    packages = with pkgs; [
    #  thunderbird
    ];
  };
}
