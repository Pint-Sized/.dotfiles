{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  services.xserver = {
    enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
      banner = ''
        0858244115 - fionnbennett06@gmail.com
      '';
    };
    xkb = {
      variant = "";
      layout = "us";
    };
  };
}
