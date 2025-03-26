{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = pkgs.hyprland;
  };
  imports = [
    ./binds.nix
    ./input.nix
    ./general.nix
    ./plugins.nix
    ./programs.nix
    ./pyprland.nix
    ./variables.nix
  ];
}
