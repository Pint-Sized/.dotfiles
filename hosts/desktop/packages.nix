{
  pkgs,
  pkgs-unstable,
  userSettings,
  ...
}: {
  environment.systemPackages =
    (with pkgs; [
      cartridges
      liquidctl
      polychromatic
      protontricks
      protonup
      openrgb-with-all-plugins
      #coolercontrol.coolercontrold
      #coolercontrol.coolercontrol-gui
      #coolercontrol.coolercontrol-ui-data
      #coolercontrol.coolercontrol-liqctld
    ])
    ++ (with pkgs-unstable; [
      lm_sensors
      vintagestory
    ]);

  #services.flatpak = {
  #packages = [];
  #};

  programs = {
    coolercontrol = {
      enable = true;
      nvidiaSupport = true;
    };
    gamemode.enable = true;
    steam.enable = true;
    gamescope = {
      enable = true;
      capSysNice = true;
    };
  };
}
