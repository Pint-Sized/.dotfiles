{ userSettings, ... }:
{
  imports = [
    ./bat.nix
    ./btop.nix
    ./cava.nix
    ./chromium.nix
    ./fastfetch.nix
    ./firefox.nix
    ./fish.nix
    ./fonts.nix
    ./foot.nix
    ./fzf.nix
    ./git.nix
    ./gtk.nix
    ./hyprland/hyprland.nix
    ./imv.nix
    ./kitty.nix
    ./mpv.nix
    ./vesktop.nix
    ./nixvim/nixvim.nix
    ./obs-studio.nix
    ./qt.nix
    ./spicetify.nix
    ./swaync.nix
    ./ulauncher.nix
    ./virtualisation.nix
    ./waybar.nix
    ./wlogout/wlogout.nix
    ./yazi.nix
    ./zathura.nix
    ./zed.nix
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
