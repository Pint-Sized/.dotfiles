{ pkgs, pkgs-unstable, ... }:
{
  environment.systemPackages =
    (with pkgs; [
      liquidctl
      polychromatic
      protontricks
      protonup-ng
      openrgb-with-all-plugins
    ])
    ++ (with pkgs-unstable; [
      vintagestory
    ]);
  programs.coolercontrol.enable = true;
}
