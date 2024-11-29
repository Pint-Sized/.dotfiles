{ pkgs, pkgs-unstable, config, lib, catppuccin, stylix, ... }:

{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    nativeMessagingHosts = [ 
      pkgs.firefoxpwa 
    ];
  };
}
