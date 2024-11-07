{
  config,
  pkgs,
  catppuccin,
  lib,
  nixvim,
  ...
}:

{
  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin.enable = true;
  };

  imports = [
  	./packages.nix
  ];
}
