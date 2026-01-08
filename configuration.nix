{
  imports = [
    ./system/hardware.nix
    ./system/packages.nix
    ./system/services.nix
    ./system/system.nix
    ./system/networking.nix
    ./system/virtualisation.nix
    ./themes/system.nix
    ./system/hyprland/hyprland.nix
    #./system/kde/kde.nix
  ];
  system.stateVersion = "23.05";
}
