{
  services = {
    devmon.enable = true;
    flatpak = {
      enable = true;
      overrides.global = {
        Context.filesystems = [
          "/usr/share/icons:ro"
          "home"
          "xdg-data/applications"
          "~/.icons:ro"
          "~/.themes:ro"
        ];
        Environment = {
          MOZ_ENABLE_WAYLAND = "1";
          NIX_OZONE = "1";
          NIX_OZONE_WL = "1";
          XCURSOR_SIZE = "16";
        };
      };
      uninstallUnmanaged = true;
      update.onActivation = true;
    };
    gvfs.enable = true;
    libinput.mouse.accelProfile = "flat";
    openssh.enable = true;
    pipewire = {
      alsa = {
        enable = true;
        support32Bit = true;
      };
      enable = true;
      jack.enable = true;
      pulse.enable = true;
    };
    udisks2.enable = true;
    solaar = {
      enable = true;
      window = "hide";
    };
  };
}
