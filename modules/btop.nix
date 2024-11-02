{
  config,
  pkgs,
  catppuccin,
  lib,
  ...
}:

{
  # ------- BTOP -------- #
  programs.btop = {
    enable = true;
    catppuccin = {
      enable = true;
      flavor = "mocha";
    };
  };
}
