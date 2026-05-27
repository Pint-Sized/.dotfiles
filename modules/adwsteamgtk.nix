{ config, ... }:
let
  colors = config.lib.stylix.colors;
in
{
  home.file.".config/AdwSteamGtk/custom.css".text = # css
    ''
      :root {
        /* Accent Colors (Base0D - Primary Accent/Blue) */
        --adw-accent-rgb: ${colors.base0D-rgb-r}, ${colors.base0D-rgb-g}, ${colors.base0D-rgb-b};
        --adw-accent-bg-rgb: ${colors.base0D-rgb-r}, ${colors.base0D-rgb-g}, ${colors.base0D-rgb-b};
        --adw-accent-fg-rgb: ${colors.base00-rgb-r}, ${colors.base00-rgb-g}, ${colors.base00-rgb-b};

        /* Destructive & Error Colors (Base08 - Red) */
        --adw-destructive-rgb: ${colors.base08-rgb-r}, ${colors.base08-rgb-g}, ${colors.base08-rgb-b};
        --adw-destructive-bg-rgb: ${colors.base08-rgb-r}, ${colors.base08-rgb-g}, ${colors.base08-rgb-b};
        --adw-destructive-fg-rgb: ${colors.base00-rgb-r}, ${colors.base00-rgb-g}, ${colors.base00-rgb-b};
        
        --adw-error-rgb: ${colors.base08-rgb-r}, ${colors.base08-rgb-g}, ${colors.base08-rgb-b};
        --adw-error-bg-rgb: ${colors.base08-rgb-r}, ${colors.base08-rgb-g}, ${colors.base08-rgb-b};
        --adw-error-fg-rgb: ${colors.base00-rgb-r}, ${colors.base00-rgb-g}, ${colors.base00-rgb-b};

        /* Success Colors (Base0B - Green) */
        --adw-success-rgb: ${colors.base0B-rgb-r}, ${colors.base0B-rgb-g}, ${colors.base0B-rgb-b};
        --adw-success-bg-rgb: ${colors.base0B-rgb-r}, ${colors.base0B-rgb-g}, ${colors.base0B-rgb-b};
        --adw-success-fg-rgb: ${colors.base00-rgb-r}, ${colors.base00-rgb-g}, ${colors.base00-rgb-b};

        /* Warning Colors (Base0A - Yellow) */
        --adw-warning-rgb: ${colors.base0A-rgb-r}, ${colors.base0A-rgb-g}, ${colors.base0A-rgb-b};
        --adw-warning-bg-rgb: ${colors.base0A-rgb-r}, ${colors.base0A-rgb-g}, ${colors.base0A-rgb-b};
        --adw-warning-fg-rgb: ${colors.base00-rgb-r}, ${colors.base00-rgb-g}, ${colors.base00-rgb-b};
        --adw-warning-fg-a: 1.0;

        /* Headerbar (Base01 - Slightly elevated from background) */
        --adw-headerbar-bg-rgb: ${colors.base01-rgb-r}, ${colors.base01-rgb-g}, ${colors.base01-rgb-b};
        --adw-headerbar-fg-rgb: ${colors.base05-rgb-r}, ${colors.base05-rgb-g}, ${colors.base05-rgb-b};
        --adw-headerbar-backdrop-rgb: ${colors.base00-rgb-r}, ${colors.base00-rgb-g}, ${colors.base00-rgb-b};
        --adw-headerbar-shade-rgb: ${colors.base00-rgb-r}, ${colors.base00-rgb-g}, ${colors.base00-rgb-b};

        /* Window & View (Base00 - Deepest Background) */
        --adw-window-bg-rgb: ${colors.base00-rgb-r}, ${colors.base00-rgb-g}, ${colors.base00-rgb-b};
        --adw-window-fg-rgb: ${colors.base05-rgb-r}, ${colors.base05-rgb-g}, ${colors.base05-rgb-b};
        --adw-view-bg-rgb: ${colors.base00-rgb-r}, ${colors.base00-rgb-g}, ${colors.base00-rgb-b};
        --adw-view-fg-rgb: ${colors.base05-rgb-r}, ${colors.base05-rgb-g}, ${colors.base05-rgb-b};

        /* Popover & Dialog (Base01 / Base02 - Elevated elements) */
        --adw-popover-bg-rgb: ${colors.base02-rgb-r}, ${colors.base02-rgb-g}, ${colors.base02-rgb-b};
        --adw-popover-fg-rgb: ${colors.base05-rgb-r}, ${colors.base05-rgb-g}, ${colors.base05-rgb-b};

        /* Cards (Base02 - UI Panels) */
        --adw-card-bg-rgb: ${colors.base02-rgb-r}, ${colors.base02-rgb-g}, ${colors.base02-rgb-b};
        --adw-card-fg-rgb: ${colors.base05-rgb-r}, ${colors.base05-rgb-g}, ${colors.base05-rgb-b};
        --adw-card-bg-a: 0.8;
      }
    '';
}
