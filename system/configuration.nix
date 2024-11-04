{
  inputs,
  config,
  pkgs,
  lib,
  catppuccin,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./hardware.nix
    ./packages.nix
    ./services.nix
    ./system.nix
    ./wifi.nix
    ./power.nix
  ];

  system.stateVersion = "23.05"; # Did you read the comment?

}
