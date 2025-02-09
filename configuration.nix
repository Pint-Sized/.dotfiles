{
  imports = [
    ./system/hardware.nix
    ./system/packages.nix
    ./system/services.nix
    ./system/system.nix
    ./system/networking.nix
    ./themes/system-theme-selector.nix
  ];
  system.stateVersion = "23.05";
}
