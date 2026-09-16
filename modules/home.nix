{ userSettings, ... }:
{
  imports = [
    ./adwsteamgtk.nix
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
    ./hypr/hyprland.nix
    ./imv.nix
    ./kitty.nix
    ./lazygit.nix
    ./mpv.nix
    ./nixvim/nixvim.nix
    ./obs-studio.nix
    ./qt.nix
    ./scripts.nix
    ./spicetify.nix
    ./splashes.nix
    ./swaync.nix
    ./swayosd.nix
    ./themes/themes.nix
    ./ulauncher.nix
    ./vesktop.nix
    ./virtualisation.nix
    ./waybar.nix
    ./wlogout.nix
    ./yazi.nix
    ./zathura.nix
    ./zed.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = true;
  };

  programs.home-manager.enable = true;

  home = {
    username = "${userSettings.username}";
    homeDirectory = "/home/${userSettings.username}/";
    enableNixpkgsReleaseCheck = false;
    stateVersion = "24.05";
  };
}
