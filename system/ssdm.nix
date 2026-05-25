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
    pkgs.kdePackages.qt5compat
    pkgs.kdePackages.qtdeclarative
    pkgs.kdePackages.qtmultimedia
    pkgs.kdePackages.qtsvg
    pkgs.quickshell

    # If your theme uses video backgrounds, add GStreamer here too!
    pkgs.gst_all_1.gst-plugins-base
    pkgs.gst_all_1.gst-plugins-good
    pkgs.gst_all_1.gst-plugins-bad
    pkgs.gst_all_1.gst-plugins-ugly
  ];
}
