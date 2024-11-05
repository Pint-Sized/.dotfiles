{
  config,
  pkgs,
  catppuccin,
  lib,
  ...
}:

{
  # ------ CAVA ------- #
  programs.cava = {
    enable = true;
    catppuccin = {
      enable = true;
      flavor = "mocha";
      transparent = true;
    };
  };
}
