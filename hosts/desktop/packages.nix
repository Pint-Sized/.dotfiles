{
  pkgs,
  pkgs-unstable,
  ...
}: {
  environment.systemPackages =
    (with pkgs; [
      cartridges
      liquidctl
      polychromatic
      protonup
      openrgb-with-all-plugins
      cartridges
    ])
    ++ (with pkgs-unstable; [
      lm_sensors
      vintagestory
    ]);

  services.flatpak = {
    packages = [
      "com.valvesoftware.Steam"
    ];
  };

  programs = {
    coolercontrol = {
      enable = true;
    };
    gamemode = {
      enable = true;
    };
    gamescope = {
      enable = true;
      capSysNice = true;
    };
  };
}
