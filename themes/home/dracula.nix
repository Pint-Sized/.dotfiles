{ pkgs, ... }:

{
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";

  programs = {
    nixvim.colorschemes.base16 = {
      enable = true;
      colorscheme = "dracula";
    };
    fish.functions = {
      fish_greeting = "pokeget noibat --hide-name | fastfetch --file-raw -";
    };
    wlogout.style = ''
       window {
              font-family: "0xProto Nerd Font";
              font-size: 14pt;
              color: #f8f8f2; /* text */
              background-color: rgba(54, 52, 71, 0.5);
          }

          button {
              background-repeat: no-repeat;
              background-position: center;
              background-size: 25%;
              border: none;
              background-color: rgba(54, 52, 71, 0);
              margin: 5px;
              transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
          }

          button:hover {
              background-color: rgba(54, 52, 71, 0.1);
          }

          button:focus {
              background-color: #bd93f9;
              color: #282a36;
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
    ".dotfiles/modules/fastfetch/theme" = {
      executable = true;
      text = ''
        echo Dracula
      '';
    };
    ".config/hypr/theme.conf" = {
      enable = true;
      text = ''
        $base00 = rgb(282a36)
        $base01 = rgb(363447)
        $base02 = rgb(44475a)
        $base03 = rgb(6272a4)
        $base04 = rgb(9ea8c7)
        $base05 = rgb(f8f8f2)
        $base06 = rgb(f0f1f4)
        $base07 = rgb(ffffff)
        $base08 = rgb(ff5555)
        $base09 = rgb(ffb86c)
        $base0A = rgb(f1fa8c)
        $base0B = rgb(50fa7b)
        $base0C = rgb(8be9fd)
        $base0D = rgb(80bfff)
        $base0E = rgb(bd93f9)
        $base0F = rgb(ff79c6)
      '';
    };
    ".config/waybar/theme.css" = {
      enable = true;
      text = ''
        @define-color base00 #282a36;
        @define-color base01 #363447;
        @define-color base02 #44475a;
        @define-color base03 #6272a4;
        @define-color base04 #9ea8c7;
        @define-color base05 #f8f8f2;
        @define-color base06 #f0f1f4;
        @define-color base07 #ffffff;
        @define-color base08 #ff5555;
        @define-color base09 #ffb86c;
        @define-color base0A #f1fa8c;
        @define-color base0B #50fa7b;
        @define-color base0C #8be9fd;
        @define-color base0D #80bfff;
        @define-color base0E #ff79c6;
        @define-color base0F #bd93f9;
      '';
    };
    ".config/ulauncher/user-themes/theme/colours.css" = {
      text = ''
        @define-color background #282a36;
        @define-color current_line_background #363447;
        @define-color foreground #9ea8c7;
        @define-color foreground_lessimportant #f8f8f2;
        @define-color accent #ffb86c;
        @define-color highlight #ffb86c;
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
            "when_selected": "#ff79c6",
            "when_not_selected": "#ff79c6"
          }
        }
      '';
    };
  };
}
