{
  inputs,
  config,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = with config.lib.stylix.colors; {
    plugins = [
      pkgs.hyprlandPlugins.hypr-dynamic-cursors
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprfocus
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprwinwrap
      inputs.hyprland-plugins.packages.${pkgs.system}.borders-plus-plus
    ];
    settings.plugin = {
      borders-plus-plus = {
        add_borders = 1;
        "col.border_1" = "rgba(${base00-rgb-r}, ${base00-rgb-g}, ${base00-rgb-b}, 0.825)";
        border_size_1 = 10;
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
      hyprwinwrap.class = "foot";
    };
  };
}
