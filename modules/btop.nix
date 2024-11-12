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
  };
}
