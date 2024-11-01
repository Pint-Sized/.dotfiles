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
    ./modules/bat/bat.nix

    # ------- BTOP ------- #
    ./modules/btop/btop.nix

    # ------- CATPPUCCIN ------- #
    ./modules/catppuccin/catppuccin.nix

    # -------- CAVA ------------ #
    ./modules/cava/cava.nix

    # ----------- FISH ------------- #
    ./modules/fish/fish.nix

    # ---------- GIT --------------# 
    ./modules/git/git.nix

    # ---------- GTK ------------- #
    ./modules/gtk/gtk.nix

    # -------------- HOME-SETTINGS ------ #
    ./modules/home-settings/home-settings.nix

    # ------------- HYPRLAND ---------- #
    ./modules/hyprland/hyprland.nix
    ./modules/hyprland/pyprland.nix
    ./modules/hyprland/mocha.nix

	# ------------ HYPRLOCK ---------- #
	./modules/hyprlock/hyprlock.nix

    # ----------- KITTY  ------------- #
    ./modules/kitty/kitty.nix

    # ----------- MICRO ---------- #
    ./modules/micro/micro.nix

    # ---------- QT ----------- #
    ./modules/qt/qt.nix

    # ------- ROFI ------------- #
    ./modules/rofi/rofi.nix

	# ---------- SWAYNC ------------ #
	./modules/swaync/swaync.nix

    # ---------- WAYBAR ----------- #
    ./modules/waybar/waybar.nix

    # -------- WLOGOUT -------- #
    ./modules/wlogout/wlogout.nix

    # --------- YAZI ------------ #
    ./modules/yazi/yazi.nix

    # --------- ZATHURA ---------- #
    ./modules/zathura/zathura.nix
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
