{
  config,
  lib,
  pkgs,
  nixvim,
  unstable-pkgs,
  ...
}:

{
  programs.nixvim.plugins.nvim-autopairs = {
    enable = true;
  };
}
