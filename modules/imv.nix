{ config, pkgs, lib, catppuccin, ... }:

{
	programs.imv = {
		enable = true;
		catppuccin = {
			enable = true;
			flavor = "mocha";
		};
	};
}
