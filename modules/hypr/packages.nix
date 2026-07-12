{ pkgs, pkgs-master, ... }:
{
  home.packages =
    (with pkgs; [
      swww
      mpvpaper
      ulauncher
      kdePackages.qt6ct
      libsForQt5.qt5ct
      swayosd
      waypaper
      wdisplays
      hyprshot
    ])
    ++ (with pkgs-master; [
      pyprland
    ])
    ++ (with pkgs.hyprlandPlugins; [
      #hyprwinwrap
      hyprfocus
      hypr-dynamic-cursors
      borders-plus-plus
      hyprfocus
    ]);
}
