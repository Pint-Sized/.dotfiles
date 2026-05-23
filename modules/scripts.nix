{
  home.file = {
    ".local/scripts/hypr-powersaver-off.sh" = {
      enable = true;
      executable = true;
      text = ''
        #!/usr/bin/env bash
        hyprctl keyword animations:enabled true
        hyprctl keyword decoration:blur:enabled true
        hyprctl keyword decoration:active_opacity 0.825
        hyprctl keyword decoration:inactive_opacity 0.825
      '';
    };
    ".local/scripts/hypr-powersaver-on.sh" = {
      enable = true;
      executable = true;
      text = ''
        #!/usr/bin/env bash
        hyprctl keyword animations:enabled false
        hyprctl keyword decoration:blur:enabled false
        hyprctl keyword decoration:active_opacity 1
        hyprctl keyword decoration:inactive_opacity 1
        hyprctl keyword plugin:hyprfocus:enabled false
        hyprctl keyword decoration:shadow:enabled false
      '';
    };
    ".local/scripts/reloader.sh" = {
      enable = true;
      executable = true;
      text = ''
        #!/usr/bin/env bash
        pkill waybar
        waybar
        pkill .ulauncher-wrap
        ulauncher --no-window-shadow
        hyprctl reload
        pkill .swaync-client-
        pkill .swaync-wrapped
        swaync
        pkill cava
        foot cava
        pkill .swayosd-server
        swayosd-server
      '';
    };
  };
}
