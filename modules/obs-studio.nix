{
  pkgs,
  config,
  lib,
  catppuccin,
  ...
}:

{
  programs.obs-studio = {
    enable = true;
  };
}
