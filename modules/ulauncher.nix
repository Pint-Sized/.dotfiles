{ config, pkgs, ... }:
let
  colors = config.lib.stylix.colors;
in
{
  home = with config.lib.stylix.colors; {
    packages = with pkgs; [
      ulauncher
    ];
    file = {
      ".config/ulauncher/user-themes/theme/manifest.json" = {
        text = ''
          {
            "manifest_version": "1",
            "name": "stylix-theme",
            "display_name": "Stylix Theme",
            "extend_theme": "dark",
            "css_file": "theme.css",
            "css_file_gtk_3.20+": "theme-gtk-3.20.css",
            "matched_text_hl_colors": {
              "when_selected": "#${colors.base0E-hex}",
              "when_not_selected": "#${colors.base0E-hex}"
            }
          }
        '';
      };
      ".config/ulauncher/user-themes/theme/theme.css" = {
        text = ''
          .app {
               background-color: #${colors.base00-hex};
               border-color: #${colors.base00-hex};
           }
           .input {
               color: #${colors.base04-hex};
           }
           .input *:selected,
           .input *:focus,
           *:selected:focus {
               background-color: alpha (#${colors.base04-hex}, 0.9);
               color: #${colors.base00-hex};
           }
           .item-text {
               color: #${colors.base05-hex};
           }
           .item-name {
               color: #${colors.base04-hex};
           }
           .selected.item-box {
               background-color: #${colors.base01-hex};
               border-left: 1px solid #${colors.base00-hex};
               border-right: 1px solid #${colors.base00-hex};
           }
           .selected.item-box .item-text {
               color: #${colors.base05-hex};
           }
           .selected.item-box .item-name {
               color: #${colors.base09-hex};
           }
           .item-shortcut {
               color: #${colors.base04-hex};
               text-shadow: 1px 1px 1px #${colors.base00-hex};
           }
           .selected.item-box .item-shortcut {
               color: #${colors.base04-hex};
               text-shadow: 1px 1px 1px #${colors.base01-hex};
           }
           .prefs-btn {
               opacity: 0.8;
           }
           .prefs-btn:hover {
               background-color: #${colors.base04-hex};
           }
        '';
      };
      ".config/ulauncher/user-themes/theme/theme-gtk-3.20.css" = {
        text = ''
          @import url("theme.css");
          .input {
              caret-color: #${colors.base04-hex};
          }
          .selected.item-box {
              border: none;
          }
        '';
      };
    };
  };
}
