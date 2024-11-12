{
  config,
  pkgs,
  lib,
  catppuccin,
  ...
}:

{
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };
}
