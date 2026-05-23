{ config, ... }:
let
  colors = config.lib.stylix.colors;
in
{
  home.file = {
    ".config/swayosd/config.toml".text = # toml
      ''
        [server]
        top_margin = 0.93
        max_volume = 150
        show_percentage = true
        playerctl_format = "{artist} - {title}"
        [client]
      '';
    ".config/swayosd/style.css".text = # css
      ''
        window#osd {
          border-radius: 10px;
          border: 2px solid #${colors.base03};
          background: alpha(#${colors.base00}, 0.4);
        }
        window#osd #container {
          margin: 6px;
          padding: 2px;
          background: transparent;
        }
        window#osd image {
          -gtk-icon-transform: scale(0.7);
        }
        window#osd image,
        window#osd label {
          color: #${colors.base0D};
        }
        window#osd progressbar:disabled,
        window#osd image:disabled {
          opacity: 0.5;
        }
        window#osd progressbar {
          min-height: 6px;
          border-radius: 999px;
          background: transparent;
          border: none;
        }
        window#osd trough {
          min-height: inherit;
          border-radius: inherit;
          border: none;
          background: alpha(#${colors.base02}, 0.5);
        }
        window#osd progress {
          min-height: inherit;
          border-radius: inherit;
          border: none;
          background: #${colors.base0D};
        }
      '';
  };
}
