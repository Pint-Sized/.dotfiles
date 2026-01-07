{userSettings, ...}: {
  imports = [
    ./modules/ghostty.nix
    # ------ AERC ------ #
    ./modules/aerc.nix

    # ------- BAT ------- #
    ./modules/bat.nix

    # ------ BOTTOM ----- #
    ./modules/bottom.nix

    # ------- BTOP ------- #
    ./modules/btop.nix

    # -------- CAVA -------- #
    ./modules/cava.nix

    # ----- CHROMIUM ----- #
    ./modules/chromium.nix

    # ------- FASTFETCH -------- #
    ./modules/fastfetch.nix

    # --------- FIREFOX ----------- #
    ./modules/firefox/firefox.nix

    # ----------- FISH ------------- #
    ./modules/fish.nix

    # ----- FOLIATE ----- #
    ./modules/foliate.nix

    # ---- FONTS ---- #
    ./fonts/fonts.nix

    # ---------- FOOT ------------ #
    ./modules/foot.nix

    # ------------ FZF ------------- #
    ./modules/fzf.nix

    # ---------- GIT --------------#
    ./modules/git.nix

    # ----- GITUI ------ #
    ./modules/gitui.nix

    # ---------- GTK ------------- #
    ./modules/gtk.nix

    # -------------- HOME-SETTINGS ------ #
    ./modules/home-settings.nix

    # ------------- HYPRLAND ---------- #
    ./modules/hyprland/hyprland.nix

    # ----- HYPRLOCK ----- #
    ./modules/hyprlock.nix

    # ---------- IMV ----------- #
    ./modules/imv.nix

    # ----------- KITTY  ------------- #
    ./modules/kitty.nix

    # ----- MICROSOFT-OFFICE ----- #
    ./applications/microsoft-office/office.nix

    # ----- LUTRIS ------ #
    ./modules/lutris.nix

    # ----- MPV ----- #
    ./modules/mpv.nix

    # ----- VESKTOP ----- #
    ./modules/vesktop.nix

    # --------- NIXVIM --------- #
    ./modules/nixvim/nixvim.nix

    # ---------- OBS-STUDIO ------------ #
    ./modules/obs-studio.nix

    # ---------- QT ----------- #
    ./modules/qt.nix

    # ------- SPICETIFY ------ #
    ./modules/spicetify.nix

    # ------- STYLIX ----------- #
    ./themes/home.nix
    ./themes/home/${userSettings.theme}.nix

    # --------- SWAYNC --------- #
    ./modules/swaync.nix

    # --------- ULAUNCHER --------- #
    ./modules/ulauncher/ulauncher.nix

    # ----- VIRTUALISATION ----- #
    ./modules/virtualisation.nix

    # ---------- WAYBAR ----------- #
    ./modules/waybar.nix

    # -------- WLOGOUT -------- #
    ./modules/wlogout/wlogout.nix

    # --------- YAZI ------------ #
    ./modules/yazi.nix

    # --------- ZATHURA ---------- #
    ./modules/zathura.nix
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
