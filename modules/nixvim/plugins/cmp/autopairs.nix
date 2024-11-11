{
  config,
  lib,
  pkgs,
  nixvim,
  catppuccin,
  unstable-pkgs,
  ...
}:

{
  programs.nixvim.plugins.nvim-autopairs = {
    enable = true;
  };
}
