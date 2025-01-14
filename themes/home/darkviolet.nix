{ pkgs, ... }:

{
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/darkviolet.yaml";

  programs.nixvim.colorschemes.base16 = {
    enable = true;
    colorscheme = "darkviolet";
  };

  programs.fish.functions = {
    fish_greeting = "pokeget purrloin --hide-name | fastfetch --file-raw -";
  };
  home.file = {
    ".dotfiles/modules/fastfetch/theme" = {
      executable = true;
      text = ''
        echo "darkviolet"
      '';
    };
  };
  home.file = {
    ".config/hypr/theme.conf" = {
      enable = true;
      text = ''
        $base00 = rgb(000000)
        $base01 = rgb(231a40)
        $base02 = rgb(432d59)
        $base03 = rgb(593380)
        $base04 = rgb(00ff00)
        $base05 = rgb(b08ae6)
        $base06 = rgb(9045e6)
        $base07 = rgb(a366ff)
        $base08 = rgb(a82ee6)
        $base09 = rgb(bb66cc)
        $base0A = rgb(f29df2)
        $base0B = rgb(4595e6)
        $base0C = rgb(40dfff)
        $base0D = rgb(4136d9)
        $base0E = rgb(7e5ce6)
        $base0F = rbg(a886bf)
      '';
    };
  };

  home.file = {
    ".config/waybar/theme.css" = {
      enable = true;
      text = ''
        @define-color base00 #000000;
        @define-color base01 #231a40;
        @define-color base02 #432d59;
        @define-color base03 #593380;
        @define-color base04 #00ff00;
        @define-color base05 #b08ae6; 
        @define-color base06 #9045e6;
        @define-color base07 #a366ff;
        @define-color base08 #a82ee6;
        @define-color base09 #bb66cc;
        @define-color base0A #f29df2;
        @define-color base0B #4595e6;
        @define-color base0C #40dfff;
        @define-color base0D #4136d9;
        @define-color base0E #7e5ce6;
        @define-color base0F #a886bf;
      '';
    };
  };
  programs.wlogout.style = ''
    window {
             font-family: "0xProto Nerd Font";
             font-size: 14pt;
             color: #b08ae6; /* text */
             background-color: rgba(47, 42, 63, 0.5);
         }

         button {
             background-repeat: no-repeat;
             background-position: center;
             background-size: 25%;
             border: none;
             background-color: rgba(47, 42, 63, 0);
             margin: 5px;
             transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
         }

         button:hover {
             background-color: rgba(47, 42, 63, 0.1);
         }

         button:focus {
             background-color: #4595e6;
             color: #000000;
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

  home.file = {
    ".config/ulauncher/user-themes/theme/colours.css" = {
      text = ''
        @define-color background #000000;
        @define-color current_line_background #231a40;
        @define-color foreground #7b43bf;
        @define-color foreground_lessimportant #b08ae6;
        @define-color accent #bb66cc;
        @define-color highlight #bb66cc;
      '';
    };
  };
  home.file = {
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
            "when_selected": "#7e5ce6",
            "when_not_selected": "#7e5ce6"
          }
        }
      '';
    };
  };
}
