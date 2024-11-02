{
  config,
  pkgs,
  catppuccin,
  lib,
  ...
}:

{
  # ------- CATPPUCCIN ------- #
  catppuccin = {
    enable = true;
    accent = "mauve";
    flavor = "mocha";
    pointerCursor = {
      enable = true;
      accent = "mauve";
      flavor = "mocha";
    };
  };
}
