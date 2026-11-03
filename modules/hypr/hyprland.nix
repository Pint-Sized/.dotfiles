{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    configType = "hyprlang";
    portalPackage = null; # NixOS provides the portals; HM would shadow them with a hyprland-only dir
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
