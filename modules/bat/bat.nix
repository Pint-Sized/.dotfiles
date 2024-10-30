{
  config,
  pkgs,
  catppuccin,
  lib,
  ...
}:

{
  # --------- BAT ---------- #
  programs.bat = {
    enable = true;
    catppuccin = {
      enable = true;
      flavor = "mocha";
    };
  };
}
