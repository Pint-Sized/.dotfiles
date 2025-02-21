{ pkgs, ... }:

{
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/snazzy.yaml";

  programs = {
    nixvim.colorschemes.base16 = {
      enable = true;
      colorscheme = "snazzy";
    };
    fish.functions = {
      fish_greeting = "pokeget purrloin --hide-name | fastfetch --file-raw -";
    };
    programs.wlogout.style = ''
      @import "icons.css";
      window {
          font-family: "0xProto Nerd Font";
          font-size: 14pt;
          color: #e2e4e5; /* text */
          background-color: rgba(52, 53, 62, 0.5);
      }

      button {
          background-repeat: no-repeat;
          background-position: center;
          background-size: 25%;
          border: none;
          background-color: rgba(52, 53, 62, 0);
          margin: 5px;
          transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
      }

      button:hover {
          background-color: rgba(52, 53, 62, 0.1);
      }

      button:focus {
          background-color: #ff6ac1;
          color: #282a36;
      }
    '';
  };
  home.file = {
    ".config/fastfetch/theme" = {
      executable = true;
      text = ''
        echo "Snazzy"
      '';
    };
    ".config/hypr/theme.conf" = {
      enable = true;
      text = ''
        $base00 = rgb(282a36)
        $base01 = rgb(34353e)
        $base02 = rgb(43454f)
        $base03 = rgb(78787e)
        $base04 = rgb(a5a5a9)
        $base05 = rgb(e2e4e5)
        $base06 = rgb(eff0eb)
        $base07 = rgb(f1f1f0)
        $base08 = rgb(ff5c57)
        $base09 = rgb(ff9f43)
        $base0A = rgb(f3f99d)
        $base0B = rgb(5af78e)
        $base0C = rgb(9aedfe)
        $base0D = rgb(57c7ff)
        $base0E = rgb(ff6ac1)
        $base0F = rbg(b2643c)
      '';
    };
    ".config/waybar/theme.css" = {
      enable = true;
      text = ''
        @define-color base00 #282a36;
        @define-color base01 #34353e;
        @define-color base02 #43454f;
        @define-color base03 #78787e;
        @define-color base04 #a5a5a9;
        @define-color base05 #e2e4e5; 
        @define-color base06 #eff0eb;
        @define-color base07 #f1f1f0;
        @define-color base08 #ff5c57;
        @define-color base09 #ff9f43;
        @define-color base0A #f3f99d;
        @define-color base0B #5af78e;
        @define-color base0C #9aedfe;
        @define-color base0D #57c7ff;
        @define-color base0E #ff6ac1;
        @define-color base0F #b2643c;
      '';
    };
    ".config/ulauncher/user-themes/theme/colours.css" = {
      text = ''
        @define-color background #34353e;
        @define-color current_line_background #282a36;
        @define-color foreground #a5a5a9;
        @define-color foreground_lessimportant #e2e4e5;
        @define-color accent #ff9f43;
        @define-color highlight #ff9f43;
      '';
    };
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
            "when_selected": "#ff6ac1",
            "when_not_selected": "#ff6ac1"
          }
        }
      '';
    };
  };
}
