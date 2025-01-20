{
  imports = [
    ./hardware-configuration.nix
    ./hardware.nix
    ./packages.nix
    ./services.nix
    ./system.nix
    ./networking.nix
    ../themes/system-theme-selector.nix
  ];
  system.stateVersion = "23.05";
}
