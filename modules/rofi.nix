{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    plugins = [
      pkgs.rofi-calc
    ];
    location = "center";
  };
  programs.fuzzel.enable = true;
}
