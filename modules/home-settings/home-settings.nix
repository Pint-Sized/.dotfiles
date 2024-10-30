{
  config,
  pkgs,
  catppuccin,
  lib,
  ...
}:

{
  home = {
    username = "fionnbennett";
    homeDirectory = "/home/fionnbennett";
    sessionVariables = {
      EDITOR = "micro";
    };
  };
}
