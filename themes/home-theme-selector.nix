{ pkgs, ... }:

{
  imports = [
    #./home/3024.nix # dusky oranges
    #./home/black-metal-venom.nix # blacked out
    #./home/catppuccin-mocha-mauve.nix # the goat
    #./home/darkviolet.nix
    #./home/dracula.nix # classic
    #./home/eighties.nix # classy greys
    ./home/google-dark.nix
    #./home/google-light.nix # light mode with accents
    #./home/greenscreen.nix
    #./home/gruvbox-material-dark-soft.nix
    #./home/horizon-terminal-dark.nix
    #./home/nord.nix
    #./home/pasque.nix
    #./home/pinky.nix
    #./home/phd.nix
    #./home/rose-pine.nix
    #./home/snazzy.nix
    #./home/spaceduck.nix
    #./home/tokyo-night-moon.nix
    #./home/uwunicorn.nix
    #./home/xcode-dusk.nix
  ];

  stylix = {
    enable = true;
    image = ../wallpapers/evening-sky.png;
    cursor = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 16;
    };
    fonts = {
      serif = {
        package = pkgs.nerdfonts;
        name = "0xProto Nerd Font";
      };
      sansSerif = {
        package = pkgs.nerdfonts;
        name = "0xProto Nerd Font";
      };
      monospace = {
        package = pkgs.nerdfonts;
        name = "0xProto Nerd Font Mono";
      };
      sizes = {
        terminal = 10;
      };
    };
    targets = {
      hyprland.enable = false;
      waybar.enable = false;
      hyprlock.enable = false;
      gtk.flatpakSupport.enable = true;
      #eog.enable = true;
      #xrecourses.enable = true;
    };
  };
}
