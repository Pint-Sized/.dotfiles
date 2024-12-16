{ config, pkgs, lib, nixvim, ... }:

{
  programs.nixvim = { enable = true; };
  imports = [
    ./auto_cmds.nix
    ./file_types.nix
    ./keymaps.nix
    ./plugins.nix
    ./settings.nix
  ];
}
