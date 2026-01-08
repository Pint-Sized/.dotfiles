{pkgs, ...}: {
  home.packages = with pkgs; [
    ulauncher
    kdePackages.qt6ct
    libsForQt5.qt5ct
    pyprland
    swayosd
    swww
    waypaper
    wdisplays
    hyprshot
  ];
}
