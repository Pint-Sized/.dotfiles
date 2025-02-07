{
  imports = [
    # ------- BAT ------- #
    ./modules/bat.nix

    # ------- BTOP ------- #
    ./modules/btop.nix

    # -------- CAVA -------- #
    ./modules/cava.nix

    # ------- FASTFETCH -------- #
    ./modules/fastfetch/fastfetch.nix

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

    #---------- HYPRLOCK --------- #
    ./modules/hyprlock.nix

    # ---------- IMV ----------- #
    ./modules/imv.nix

    # ----------- KITTY  ------------- #
    ./modules/kitty.nix

    # --------- LIBREWOLF ----------- #
    ./modules/librewolf.nix

    # -------- MANGOHUD -------- #
    ./modules/mangohud.nix

    # ------------ MPV ------------ #
    ./modules/mpv.nix

    # --------- NIXVIM --------- #
    ./modules/nixvim/nixvim.nix

    # ---------- OBS-STUDIO ------------ #
    ./modules/obs-studio.nix

    # ---------- QT ----------- #
    ./modules/qt.nix

    # ------- SPICETIFY ------ #
    ./modules/spicetify.nix

    # --------- SWAYODS -------- #
    ./modules/swayosd.nix

    # --------- SWAYNC --------- #
    ./modules/swaync.nix

    # ------- THEMES ----------- #
    ./themes/home-theme-selector.nix

    # --------- ULAUNCHER --------- #
    ./modules/ulauncher.nix

    # ---------- WAYBAR ----------- #
    ./modules/waybar.nix

    # -------- WLOGOUT -------- #
    ./modules/wlogout.nix

    # --------- YAZI ------------ #
    ./modules/yazi/yazi.nix

    # --------- ZATHURA ---------- #
    ./modules/zathura.nix

    # --------- ZED --------- #
    ./modules/zed.nix
  ];

  programs.home-manager.enable = true; # allows home-manager to manage itself
  home.stateVersion = "24.05"; # do not change without consulting manual
}
