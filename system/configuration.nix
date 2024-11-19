{
  inputs,
  config,
  pkgs,
  lib,
  catppuccin,
  flatpak-nix,
  ...
}:
{
  imports = [
    # Include the results of the hardware scan.
    /etc/nixos/hardware-configuration.nix
    ./hardware.nix
    ./packages.nix
    ./services.nix
    ./system.nix
    ./wifi.nix
    ./power.nix
    ../system-theme-selector.nix
  ];

  system.stateVersion = "23.05"; # Did you read the comment?

}
