{
  pkgs,
  lib,
  catppuccin,
  config,
  ...
}:

{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "0xProto Nerd Font:size=11";
      };
    };
    catppuccin = {
      enable = true;
      flavor = "mocha";
    };
  };
}
