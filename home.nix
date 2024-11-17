{
  config,
  pkgs,
  catppuccin,
  lib,
  unstable-pkgs,
  nixvim,
  ...
}:

{
  imports = [
    # ------- BAT ------- #
    ./modules/bat.nix

    # ------- BTOP ------- #
    ./modules/btop.nix

    # ------- FASTFETCH -------- #
    ./modules/fastfetch.nix

    # ----------- FISH ------------- #
    ./modules/fish.nix

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

    # ------------ MPV ------------ #
    ./modules/mpv.nix

    # --------- NEOVIDE ------------ #
    ./modules/neovide.nix

    # --------- NIXVIM --------- # 
    ./modules/nixvim/nixvim.nix

    # ---------- OBS-STUDIO ------------ #
    ./modules/obs-studio.nix

    # -------- PYPRLAND ------------- # 
    ./modules/pyprland.nix

    # ---------- QT ----------- #
    ./modules/qt.nix

    # ---------- SWAYNC ------------ #
    ./modules/swaync.nix

    # ------- THEMES ----------- # 
    ./themes/selector.nix

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
