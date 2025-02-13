{ userSettings, ... }:

{
  imports = [
    # ------ AERC ------ #
    ./modules/aerc.nix

    # ------- BAT ------- #
    ./modules/bat.nix

    # ------- BTOP ------- #
    ./modules/btop.nix

    # -------- CAVA -------- #
    ./modules/cava.nix

    # ------- FASTFETCH -------- #
    ./modules/fastfetch.nix

    # ----------- FISH ------------- #
    ./modules/fish.nix

    # ---------- FOOT ------------ #
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
    ./modules/hyprland/hyprland.nix

    #---------- HYPRLOCK --------- #
    ./modules/hyprlock.nix

    # ---------- IMV ----------- #
    ./modules/imv.nix

    # ----------- KITTY  ------------- #
    ./modules/kitty.nix

    # --------- LIBREWOLF ----------- #
    ./modules/librewolf.nix

    # -------- MANGOHUD -------- #
    #./modules/mangohud.nix

    # ------------ MPV ------------ #
    ./modules/mpv.nix

    # -------- NIXCORD ------- #
    #./modules/nixcord.nix

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

    # ------- STYLIX ----------- #
    ./themes/home/stylix.nix
    ./themes/home/${userSettings.theme}

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
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = true;
  };
  programs.home-manager.enable = true; # allows home-manager to manage itself
  home = {
    enableNixpkgsReleaseCheck = false;
    stateVersion = "24.05"; # do not change without consulting manual
  };
}
