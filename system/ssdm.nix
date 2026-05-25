{
  pkgs,
  inputs,
  systemSettings,
  ...
}:

{
  services.displayManager.sddm = {
    enable = true;
    #theme = "";
  };
  environment.systemPackages = [
    inputs.quickshell.packages.${systemSettings.system}.default

  ];
}
