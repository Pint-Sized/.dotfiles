{
  pkgs,
  inputs,
  systemSettings,
  ...
}:

{
  services.displayManager.sddm = {
    enable = true;
    theme = "/usr/share/sddm/themes/pixel-dusk-city";
  };
  environment.systemPackages = [
    inputs.quickshell.packages.${systemSettings.system}.default
    pkgs.qt6.qtdeclarative
    pkgs.qt6.qt5compat
    pkgs.qt6.qtmultimedia
    pkgs.gst_all_1.gst-plugins-base
    pkgs.gst_all_1.gst-plugins-good
    pkgs.gst_all_1.gst-plugins-bad
    pkgs.gst_all_1.gst-plugins-ugly
  ];
}
