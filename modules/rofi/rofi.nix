{
  config,
  pkgs,
  catppuccin,
  lib,
  ...
}:

{
  # ---------- ROFI ------------ #
  programs.rofi = {
    enable = true;
    font = "0xProto Nerd Font";
  };

}
