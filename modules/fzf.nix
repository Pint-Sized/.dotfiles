{ config, pkgs, lib, catppuccin, ... }:

{
	programs.fzf = {
		enable = true;
		catppuccin = {
			enable = true;
			accent = "mauve";
			flavor = "mocha";
		};
		enableFishIntegration = true;
	};
}
