{ pkgs, ... }:

{
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/spaceduck.yaml";

  programs = {
    nixvim.colorschemes.base16 = {
      enable = true;
      colorscheme = "spaceduck";
    };
    fish.functions = {
      fish_greeting = "pokeget ducklett --hide-name | fastfetch --file-raw -";
    };
    programs.wlogout.style = ''
      window {
               font-family: "0xProto Nerd Font";
               font-size: 14pt;
               color: #ecf0c1; /* text */
               background-color: rgba(27, 28, 53, 0.5);
           }

           button {
               background-repeat: no-repeat;
               background-position: center;
               background-size: 25%;
               border: none;
               background-color: rgba(27, 28, 54, 0);
               margin: 5px;
               transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
           }

           button:hover {
               background-color: rgba(27, 28, 54, 0.1);
           }

           button:focus {
               background-color: #00a3cc;
               color: #16172d;
           }

           #lock {
               background-image: image(url("./images/lock.png"));
           }
           #lock:focus {
               background-image: image(url("./images/lock-hover.png"));
           }

           #logout {
               background-image: image(url("./images/logout.png"));
           }
           #logout:focus {
               background-image: image(url("./images/logout-hover.png"));
           }

           #suspend {
               background-image: image(url("./images/sleep.png"));
           }
           #suspend:focus {
               background-image: image(url("./images/sleep-hover.png"));
           }

           #shutdown {
               background-image: image(url("./images/power.png"));
           }
           #shutdown:focus {
               background-image: image(url("./images/power-hover.png"));
           }

           #reboot {
               background-image: image(url("./images/restart.png"));
           }
           #reboot:focus {
               background-image: image(url("./images/restart-hover.png"));
           }

           #hibernate {
       	background-image: image(url("./images/sleep.png"));
           }
           #hibernate:focus {
       	background-image: image(url("./images/sleep-hover.png"));
           }
    '';
  };
  home.file = {
    ".config/fastfetch/theme" = {
      executable = true;
      text = ''
        echo SpaceDuck
      '';
    };
    ".config/hypr/theme.conf" = {
      enable = true;
      text = ''
        $base00 = rgb(16172d)
        $base01 = rgb(1b1c36)
        $base02 = rgb(30365F)
        $base03 = rgb(686f9a)
        $base04 = rgb(818596)
        $base05 = rgb(ecf0c1)
        $base06 = rgb(c1c3cc)
        $base07 = rgb(ffffff)
        $base08 = rgb(e33400)
        $base09 = rgb(e39400)
        $base0A = rgb(f2ce00)
        $base0B = rgb(5ccc96)
        $base0C = rgb(b3a1e6)
        $base0D = rgb(7a5ccc)
        $base0E = rgb(00a3cc)
        $base0F = rbg(ce6f8f)
      '';
    };
    ".config/waybar/theme.css" = {
      enable = true;
      text = ''
        @define-color base00 #16172d;
        @define-color base01 #1b1c36;
        @define-color base02 #30365F;
        @define-color base03 #686f9a;
        @define-color base04 #818596;
        @define-color base05 #ecf0c1; 
        @define-color base06 #c1c3cc;
        @define-color base07 #ffffff;
        @define-color base08 #e33400;
        @define-color base09 #e39400;
        @define-color base0A #f2ce00;
        @define-color base0B #5ccc96;
        @define-color base0C #00a3cc;
        @define-color base0D #7a5ccc;
        @define-color base0E #b3a1e6;
        @define-color base0F #ce6f8f;
      '';
    };
    ".config/ulauncher/user-themes/theme/colours.css" = {
      text = ''
        @define-color background #1b1c36;
        @define-color current_line_background #16172d;
        @define-color foreground #818596;
        @define-color foreground_lessimportant #ecf0c1;
        @define-color accent #e39400;
        @define-color highlight #e39400;
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
            "when_selected": "#b3a1e6",
            "when_not_selected": "#b3a1e6"
          }
        }
      '';
    };
  };
}
