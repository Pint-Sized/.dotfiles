{
  imports = [
    ./hardware.nix
    ./packages.nix
    ./services.nix
    ./system.nix
    ./networking.nix
    ./virtualisation.nix
    ./hyprland.nix
  ];
  system.stateVersion = "23.05";
}
