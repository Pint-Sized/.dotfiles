{ userSettings, pkgs, ... }:

{
  stylix = {
    enable = true;
    image = ../../wallpapers/evening-sky.png;
    cursor = {
      name = userSettings.cursorName;
      package = pkgs.bibata-cursors;
      size = 16;
    };
    fonts = {
      serif = {
        name = userSettings.fontSerif;
        package = pkgs.nerdfonts;
      };
      sansSerif = {
        name = userSettings.fontSerif;
        package = pkgs.nerdfonts;
      };
      monospace = {
        name = userSettings.fontMono;
        package = pkgs.nerdfonts;
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
      cavalier.enable = false;
      foot.enable = false;
    };
  };
}
