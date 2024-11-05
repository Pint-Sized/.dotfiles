{ pkgs, config, lib, catppuccin }:

{
	programs.mpv = {
		enable = true;
		catppuccin = {
			enable = true;
			accent = "mauve";
			flavor = "mocha";
		};
	};
}
