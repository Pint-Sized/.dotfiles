{ pkgs, ... }:

{
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/3024.yaml";

  programs = {
    nixvim.colorschemes.base16 = {
      enable = true;
      colorscheme = "3024";
    };
    fish.functions = {
      fish_greeting = "pokeget pidove --hide-name | fastfetch --file-raw -";
    };
    wlogout.style = ''
      @import "icons.css";
      window {
          font-family: "0xProto Nerd Font";
          font-size: 14pt;
          color: #a5a2a2; /* text */
          background-color: rgba(58, 52, 50, 0.5);
      }

      button {
          background-repeat: no-repeat;
          background-position: center;
          background-size: 25%;
          border: none;
          background-color: rgba(58, 52, 50, 0);
          margin: 5px;
          transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
      }

      button:hover {
          background-color: rgba(58, 52, 50, 0.1);
      }

      button:focus {
          background-color: #a16a94;
          color: #090300;
      }
    '';
  };
  home.file = {
    ".config/fastfetch/theme" = {
      executable = true;
      text = ''
        echo 3024
      '';
    };
    ".config/hypr/theme.conf" = {
      enable = true;
      text = ''
        $base00 = rgb(090300)
        $base01 = rgb(3a3432)
        $base02 = rgb(4a4543)
        $base03 = rgb(5c5855)
        $base04 = rgb(807d7c)
        $base05 = rgb(a5a2a2)
        $base06 = rgb(d6d5d4)
        $base07 = rgb(f7f7f7)
        $base08 = rgb(db2d20)
        $base09 = rgb(e8bbd0)
        $base0A = rgb(fded02)
        $base0B = rgb(01a252)
        $base0C = rgb(b5e4f4)
        $base0D = rgb(01a0e4)
        $base0E = rgb(a16a94)
        $base0F = rbg(cdab53)
      '';
    };
    ".config/waybar/theme.css" = {
      enable = true;
      text = ''
        @define-color base00 #090300;
        @define-color base01 #3a3432;
        @define-color base02 #4a4543;
        @define-color base03 #5c5855;
        @define-color base04 #807d7c;
        @define-color base05 #a5a2a2; 
        @define-color base06 #d6d5d4;
        @define-color base07 #f7f7f7;
        @define-color base08 #db2d20;
        @define-color base09 #e8bbd0;
        @define-color base0A #fded02;
        @define-color base0B #01a252;
        @define-color base0C #b5e4f4;
        @define-color base0D #01a0e4;
        @define-color base0E #a16a94;
        @define-color base0F #cdab53;
      '';
    };
    ".config/ulauncher/user-themes/theme/colours.css" = {
      text = ''
        @define-color background #3a3432;
        @define-color current_line_background #090300;
        @define-color foreground #807d7c;
        @define-color foreground_lessimportant #a5a2a2;
        @define-color accent #e8bbd0;
        @define-color highlight #e8bbd0;
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
            "when_selected": "#a16a94",
            "when_not_selected": "#a16a94"
          }
        }
      '';
    };
  };
}
