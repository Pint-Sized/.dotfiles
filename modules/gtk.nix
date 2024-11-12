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
    font = {
      name = "0xProto Nerd Font";
      size = 10;
    };
  };
}
