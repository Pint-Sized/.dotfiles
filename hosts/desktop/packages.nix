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
      lm_sensors
    ]);

  services.flatpak = {
    packages = [
      "at.vintagestory.VintageStory"
      #"com.valvesoftware.Steam"
    ];
    #overrides = {
    #"com.valvesoftware.Steam".Context = {
    #filesystems = [
    #"/home/$USER"
    #];
    #};
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
