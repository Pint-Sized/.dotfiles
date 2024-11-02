{
  config,
  pkgs,
  catppuccin,
  lib,
  ...
}:

{
  imports = [
    # ------- BAT ------- #
    ./modules/bat.nix

    # ------- BTOP ------- #
    ./modules/btop.nix

    # ------- CATPPUCCIN ------- #
    ./modules/catppuccin.nix

    # -------- CAVA ------------ #
    ./modules/cava.nix

    # ----------- FISH ------------- #
    ./modules/fish.nix

	  # --------- GEDIT ------------- # 
	  ./modules/gedit.nix

    # ---------- GIT --------------# 
    ./modules/git.nix

    # ---------- GTK ------------- #
    ./modules/gtk.nix

    # -------------- HOME-SETTINGS ------ #
    ./modules/home-settings.nix

    # ------------- HYPRLAND ---------- #
    ./modules/hyprland.nix
    ./modules/pyprland.nix

	# ------------ HYPRLOCK ---------- #
	./modules/hyprlock.nix

    # ----------- KITTY  ------------- #
    ./modules/kitty.nix

    # ----------- MICRO ---------- #
    ./modules/micro.nix

    # ---------- QT ----------- #
    ./modules/qt.nix

    # ------- ROFI ------------- #
    ./modules/rofi.nix

	# ---------- SWAYNC ------------ #
	./modules/swaync.nix

    # ---------- WAYBAR ----------- #
    ./modules/waybar.nix

    # -------- WLOGOUT -------- #
    ./modules/wlogout.nix

    # --------- YAZI ------------ #
    ./modules/yazi.nix

    # --------- ZATHURA ---------- #
    ./modules/zathura.nix
  ];

  programs.home-manager.enable = true; # allows home-manager to manage itself
  home.stateVersion = "24.05"; # do not change without consulting manual
}
