{
  pkgs,
  inputs,
  ...
}:

{
  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;
    theme = "homeless";
  };
  environment.systemPackages = [
    inputs.nur.packages.${pkgs.stdenv.hostPlatform.system}.sddm-theme
    pkgs.quickshell
    pkgs.qt6.qtdeclarative
    pkgs.qt6.qt5compat
    pkgs.qt6.qtmultimedia
    pkgs.gst_all_1.gst-plugins-base
    pkgs.gst_all_1.gst-plugins-good
    pkgs.gst_all_1.gst-plugins-bad
    pkgs.gst_all_1.gst-plugins-ugly
  ];
}
