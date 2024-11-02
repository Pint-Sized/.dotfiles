{
  config,
  pkgs,
  catppuccin,
  lib,
  ...
}:
{
  gtk = {
    enable = true;
    catppuccin = {
      enable = true;
      accent = "mauve";
      flavor = "mocha";
      size = "standard";
      tweaks = [ "normal" ];
      icon = {
        enable = true;
        accent = "mauve";
        flavor = "mocha";
      };
    };
    font = {
      name = "0xProto Nerd Font";
      size = 10;
    };
    cursorTheme = {
      size = 16;
      name = "catppuccin-mocha-mauve-cursors";
      package = pkgs.catppuccin-cursors.mochaMauve;
    };
  };
}
