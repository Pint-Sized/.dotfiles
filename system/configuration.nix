{
  imports = [
    ./hardware.nix
    ./hyprland.nix
    ./networking.nix
    ./packages.nix
    ./sddm.nix
    ./services.nix
    ./system.nix
    ./themes.nix
    ./virtualisation.nix

    ./grub.nix
  ];
  system.stateVersion = "23.05";
}
