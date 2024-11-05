{ pkgs, config, lib, catppuccin, ... }:

{
	programs.obs-studio = {
		enable = true;
		catppuccin = {
			enable = true;
			flavor = "mocha";
		};
	};
}
