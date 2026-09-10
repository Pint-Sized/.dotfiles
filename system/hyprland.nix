{ pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  services.xserver = {
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
}
