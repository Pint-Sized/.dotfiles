{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:
let
  colors = config.lib.stylix.colors;
in
{
  stylix.targets.gtk.enable = true;

  home.file.".config/AdwSteamGtk/custom.css".text = # css
    ''
      * {
        font-family: "${userSettings.fontPropo}", sans-serif !important;
      }
      /* 1. GTK Native Variables */
      @define-color window_bg_color #${colors.base01};
      @define-color view_bg_color #${colors.base00};

      /* THE FIX: Explicitly target the sidebar */
      @define-color sidebar_bg_color #${colors.base01};
      @define-color sidebar_fg_color #${colors.base05};
      @define-color sidebar_backdrop_color #${colors.base01};

      @define-color headerbar_bg_color #${colors.base01};
      @define-color headerbar_backdrop_color #${colors.base00};
      @define-color popover_bg_color #${colors.base02};
      @define-color card_bg_color #${colors.base02};
      @define-color accent_color #${colors.base0D};
      @define-color accent_bg_color #${colors.base0D};
      @define-color destructive_bg_color #${colors.base08};
      @define-color success_bg_color #${colors.base0B};
      @define-color warning_bg_color #${colors.base0A};

      :root {
        /* 2. Explicit Hex Variables */
        --window-bg-color: #${colors.base01};
        --window-fg-color: #${colors.base05};
        --view-bg-color: #${colors.base00};
        --view-fg-color: #${colors.base05};
        
        /* THE FIX: Explicitly target the sidebar hex values */
        --sidebar-bg-color: #${colors.base01};
        --sidebar-fg-color: #${colors.base05};

        --headerbar-bg-color: #${colors.base01};
        --headerbar-fg-color: #${colors.base05};
        --popover-bg-color: #${colors.base02};
        --popover-fg-color: #${colors.base05};
        --card-bg-color: #${colors.base02};
        --card-fg-color: #${colors.base05};
        --accent-color: #${colors.base0D};
        --accent-bg-color: #${colors.base0D};
        --accent-fg-color: #${colors.base00};

        /* 3. Original RGB Variables */
        --adw-window-bg-rgb: ${colors.base01-rgb-r}, ${colors.base01-rgb-g}, ${colors.base01-rgb-b};
        --adw-window-fg-rgb: ${colors.base05-rgb-r}, ${colors.base05-rgb-g}, ${colors.base05-rgb-b};
        --adw-view-bg-rgb: ${colors.base00-rgb-r}, ${colors.base00-rgb-g}, ${colors.base00-rgb-b};
        --adw-view-fg-rgb: ${colors.base05-rgb-r}, ${colors.base05-rgb-g}, ${colors.base05-rgb-b};
        
        /* THE FIX: Explicitly target the sidebar RGB values */
        --adw-sidebar-bg-rgb: ${colors.base01-rgb-r}, ${colors.base01-rgb-g}, ${colors.base01-rgb-b};
        --adw-sidebar-fg-rgb: ${colors.base05-rgb-r}, ${colors.base05-rgb-g}, ${colors.base05-rgb-b};

        --adw-headerbar-bg-rgb: ${colors.base01-rgb-r}, ${colors.base01-rgb-g}, ${colors.base01-rgb-b};
        --adw-headerbar-fg-rgb: ${colors.base05-rgb-r}, ${colors.base05-rgb-g}, ${colors.base05-rgb-b};
        --adw-headerbar-backdrop-rgb: ${colors.base00-rgb-r}, ${colors.base00-rgb-g}, ${colors.base00-rgb-b};
        --adw-headerbar-shade-rgb: ${colors.base00-rgb-r}, ${colors.base00-rgb-g}, ${colors.base00-rgb-b};
        
        --adw-popover-bg-rgb: ${colors.base02-rgb-r}, ${colors.base02-rgb-g}, ${colors.base02-rgb-b};
        --adw-popover-fg-rgb: ${colors.base05-rgb-r}, ${colors.base05-rgb-g}, ${colors.base05-rgb-b};
        
        --adw-card-bg-rgb: ${colors.base02-rgb-r}, ${colors.base02-rgb-g}, ${colors.base02-rgb-b};
        --adw-card-fg-rgb: ${colors.base05-rgb-r}, ${colors.base05-rgb-g}, ${colors.base05-rgb-b};

        --adw-accent-rgb: ${colors.base0D-rgb-r}, ${colors.base0D-rgb-g}, ${colors.base0D-rgb-b};
        --adw-accent-bg-rgb: ${colors.base0D-rgb-r}, ${colors.base0D-rgb-g}, ${colors.base0D-rgb-b};
        --adw-accent-fg-rgb: ${colors.base00-rgb-r}, ${colors.base00-rgb-g}, ${colors.base00-rgb-b};

        --adw-destructive-rgb: ${colors.base08-rgb-r}, ${colors.base08-rgb-g}, ${colors.base08-rgb-b};
        --adw-destructive-bg-rgb: ${colors.base08-rgb-r}, ${colors.base08-rgb-g}, ${colors.base08-rgb-b};
        --adw-destructive-fg-rgb: ${colors.base00-rgb-r}, ${colors.base00-rgb-g}, ${colors.base00-rgb-b};

        --adw-success-rgb: ${colors.base0B-rgb-r}, ${colors.base0B-rgb-g}, ${colors.base0B-rgb-b};
        --adw-success-bg-rgb: ${colors.base0B-rgb-r}, ${colors.base0B-rgb-g}, ${colors.base0B-rgb-b};
        --adw-success-fg-rgb: ${colors.base00-rgb-r}, ${colors.base00-rgb-g}, ${colors.base00-rgb-b};

        --adw-warning-rgb: ${colors.base0A-rgb-r}, ${colors.base0A-rgb-g}, ${colors.base0A-rgb-b};
        --adw-warning-bg-rgb: ${colors.base0A-rgb-r}, ${colors.base0A-rgb-g}, ${colors.base0A-rgb-b};
        --adw-warning-fg-rgb: ${colors.base00-rgb-r}, ${colors.base00-rgb-g}, ${colors.base00-rgb-b};
      }
    '';
  home.activation.installAdwSteamGtk =
    lib.hm.dag.entryAfter [ "writeBoundary" ] # sh
      ''
        rm -f ~/.cache/AdwSteamInstaller/extracted/custom/custom.css
        ${pkgs.adwsteamgtk}/bin/adwaita-steam-gtk -i -o 'color_theme:adwaita'
      '';
}
