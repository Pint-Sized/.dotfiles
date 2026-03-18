{
  inputs,
  config,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = with config.lib.stylix.colors; {
    plugins = [
      #pkgs.hyprlandPlugins.hypr-dynamic-cursor
      pkgs.hyprlandPlugins.hyprwinwrap
      #inputs.hyprland-plugins.packages.${pkgs.system}.hyprwinwrap
      inputs.hyprland-plugins.packages.${pkgs.system}.borders-plus-plus
      inputs.hyprfocus.packages.${pkgs.system}.hyprfocus
    ];
    settings.plugin = {
      hyprfocus = {
        enabled = "no";
        mode = "shrink";
        shrink_percentage = 0.8;
        in_speed = 0.5;
        out_speed = 3;
      };
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
