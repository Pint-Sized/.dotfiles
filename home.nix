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

    # ------- FASTFETCH -------- #
    ./modules/fastfetch.nix

    # ----------- FISH ------------- #
    ./modules/fish.nix

    # --------- FOOT -------------- #
    ./modules/foot.nix

    # ------------ FZF ------------- # 
    ./modules/fzf.nix

    # ---------- GIT --------------# 
    ./modules/git.nix

    # ---------- GTK ------------- #
    ./modules/gtk.nix

    # -------------- HOME-SETTINGS ------ #
    ./modules/home-settings.nix

    # ------------- HYPRLAND ---------- #
    ./modules/hyprland.nix


	  # ------------ HYPRLOCK ---------- #
	  ./modules/hyprlock.nix

    # ---------- IMV ----------- #
    ./modules/imv.nix

    # ----------- KITTY  ------------- #
    ./modules/kitty.nix

    # ----------- MICRO ---------- #
    ./modules/micro.nix

    # ------------ MPV ------------ #
    ./modules/mpv.nix

    # --------- NEOVIM --------- # 
    # ./modules/neovim/neovim.nix

    # ---------- OBS-STUDIO ------------ #
    ./modules/obs-studio.nix

    # -------- PYPRLAND ------------- # 
    ./modules/pyprland.nix

    # ---------- QT ----------- #
    ./modules/qt.nix

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
