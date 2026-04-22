{ userSettings, ... }:
{
  imports = [
    ./modules/bat.nix
    ./modules/btop.nix
    ./modules/cava.nix
    ./modules/chromium.nix
    ./modules/fastfetch.nix
    ./modules/firefox.nix
    ./modules/fish.nix
    ./modules/fonts.nix
    ./modules/foot.nix
    ./modules/fzf.nix
    ./modules/git.nix
    ./modules/gtk.nix
    ./modules/hyprland/hyprland.nix
    ./modules/imv.nix
    ./modules/kitty.nix
    ./modules/mpv.nix
    ./modules/vesktop.nix
    ./modules/nixvim/nixvim.nix
    ./modules/obs-studio.nix
    ./modules/qt.nix
    ./modules/spicetify.nix
    ./modules/swaync.nix
    ./modules/ulauncher.nix
    ./modules/virtualisation.nix
    ./modules/waybar.nix
    ./modules/wlogout/wlogout.nix
    ./modules/yazi.nix
    ./modules/zathura.nix
    ./modules/zed.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = true;
  };

  programs.home-manager.enable = true; # allows home-manager to manage itself

  home = {
    username = "${userSettings.username}";
    homeDirectory = "/home/${userSettings.username}/";
    enableNixpkgsReleaseCheck = false;
    stateVersion = "24.05"; # do not change without consulting manual
  };
}
