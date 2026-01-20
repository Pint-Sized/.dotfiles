{
  pkgs,
  inputs,
  ...
}: {
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    xwayland.enable = true;
  };
  services.xserver = {
    enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
    xkb = {
      variant = "";
      layout = "us";
    };
  };
}
