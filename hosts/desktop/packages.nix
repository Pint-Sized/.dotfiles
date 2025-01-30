{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages =
    (with pkgs; [
      liquidctl
      openrazer-daemon
      polychromatic
    ])
    ++ (with pkgs-unstable; [
      lm_sensors
    ]);

  services.flatpak.packages = [
    "at.vintagestory.VintageStory"
  ];

  programs.coolercontrol.enable = true;
}
