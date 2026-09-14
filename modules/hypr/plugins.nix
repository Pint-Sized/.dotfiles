{ config, pkgs, ... }:
let
  colors = config.lib.stylix.colors;
in
{
  wayland.windowManager.hyprland = {
    plugins = [
      #pkgs.hyprlandPlugins.hyprwinwrap
      #pkgs.hyprlandPlugins.hyprfocus
      pkgs.hyprlandPlugins.hypr-dynamic-cursors
      pkgs.hyprlandPlugins.borders-plus-plus
      pkgs.hyprlandPlugins.hyprfocus
    ];
    settings.plugin = {
      borders-plus-plus = {
        add_borders = 1;
        "col.border_1" =
          "rgba(${colors.base00-rgb-r}, ${colors.base00-rgb-g}, ${colors.base00-rgb-b}, 0.8)";
        border_size_1 = 6;
        natural_rounding = "on";
      };
      dynamic-cursors = {
        enabled = true;
        mode = "tilt";
        threshold = 2;
        shake.enabled = false;
        tilt = {
          limit = 4000;
          function = "negative_quadratic";
        };
      };
      #hyprwinwrap.class = "foot";
    };
  };
}
