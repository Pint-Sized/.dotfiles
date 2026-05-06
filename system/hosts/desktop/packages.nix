{ pkgs, pkgs-unstable, ... }:
{
  environment.systemPackages =
    (with pkgs; [
      liquidctl
      openrgb-with-all-plugins
      polychromatic
      protontricks
      protonup-ng
    ])
    ++ (with pkgs-unstable; [
      vintagestory
    ]);

  programs.coolercontrol.enable = true;
}
