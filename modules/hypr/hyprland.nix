{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    configType = "hyprlang";
  };
  imports = [
    ./binds.nix
    ./input.nix
    ./general.nix
    ./plugins.nix
    ./pyprland.nix
    ./startup.nix
    ./packages.nix
  ];
}
