{
  imports = [
    ./system/hardware.nix
    ./system/packages.nix
    ./system/services.nix
    ./system/system.nix
    ./system/networking.nix
    ./themes/system/stylix.nix
    ./themes/system.nix
  ];
  system.stateVersion = "23.05";
}
