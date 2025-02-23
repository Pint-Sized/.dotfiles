{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages =
    (with pkgs; [
      liquidctl
      openrazer-daemon
      polychromatic
      openrgb-with-all-plugins
      cartridges
    ])
    ++ (with pkgs-unstable; [
      adwsteamgtk
      lm_sensors
      vintagestory
    ]);

  services.flatpak = {
    packages = [
    ];
  };

  programs = {
    coolercontrol = {
      enable = true;
    };
    steam = {
      enable = true;
      gamescopeSession = {
        enable = true;
      };
    };
    gamemode = {
      enable = true;
    };
  };
}
