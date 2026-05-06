{
  imports = [
    ./hardware.nix
    ./hyprland.nix
    ./networking.nix
    ./packages.nix
    ./services.nix
    ./system.nix
    ./themes.nix
    ./virtualisation.nix
  ];
  system.stateVersion = "23.05";
}
