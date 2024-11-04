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
    pointerCursor = {
    	size = 16;
    	name  = "catppuccin-mocha-mauve-cursors";
    	x11 = {
    		enable = true;
    		defaultCursor = "catppuccin-mocha-mauve-cursors";
    	};
    };
  };
}
