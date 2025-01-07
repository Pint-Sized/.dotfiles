{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    font = "0xProto Nerd Font Mono 14";
    plugins = [
      pkgs.rofi-calc
    ];
    location = "center";
  };
}
