{ pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services = {
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };

    xserver = {
      enable = true;
      excludePackages = [
        pkgs.nano
        pkgs.xterm
      ];
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };
}
