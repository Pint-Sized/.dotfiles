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
    ./auto_cmds.nix
    ./file_types.nix
    ./keymaps.nix
    ./plugins.nix
    ./settings.nix
  ];
}
