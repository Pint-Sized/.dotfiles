{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    package = pkgs.librewolf;
    nativeMessagingHosts = [ pkgs.firefoxpwa ];
  };
}
