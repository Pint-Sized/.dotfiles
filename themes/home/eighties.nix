{ pkgs, ... }:

{
  programs.nixvim.colorschemes.base16 = {
    enable = true;
    colorscheme = "eighties";
  };

  programs.fish.functions = {
    fish_greeting = "pokeget purrloin --hide-name | fastfetch --file-raw -";
  };
  home.file = {
    ".dotfiles/modules/fastfetch/theme" = {
      executable = true;
      text = ''
        echo Eighties
      '';
    };
  };
  home.file = {
    ".config/hypr/theme.conf" = {
      enable = true;
      text = ''
        $base00 = rgb(2d2d2d)
        $base01 = rgb(393939)
        $base02 = rgb(515151)
        $base03 = rgb(747369)
        $base04 = rgb(a09f93)
        $base05 = rgb(d3d0c8)
        $base06 = rgb(e8e6df)
        $base07 = rgb(f2f0ec)
        $base08 = rgb(f2777a)
        $base09 = rgb(f99157)
        $base0A = rgb(ffcc66)
        $base0B = rgb(99cc99)
        $base0C = rgb(66cccc)
        $base0D = rgb(6699cc)
        $base0E = rgb(cc99cc)
        $base0F = rbg(d27b53)
      '';
    };
  };

  home.file = {
    ".config/waybar/theme.css" = {
      enable = true;
      text = ''
        @define-color base00 #2d2d2d;
        @define-color base01 #393939;
        @define-color base02 #515151;
        @define-color base03 #747369;
        @define-color base04 #a09f93;
        @define-color base05 #d3d0c8; 
        @define-color base06 #e8e6df;
        @define-color base07 #f2f0ec;
        @define-color base08 #f2777a;
        @define-color base09 #f99157;
        @define-color base0A #ffcc66;
        @define-color base0B #99cc99;
        @define-color base0C #66cccc;
        @define-color base0D #6699cc;
        @define-color base0E #cc99cc;
        @define-color base0F #d27b53;
      '';
    };
  };
  programs.wlogout.style = ''
    window {
             font-family: "0xProto Nerd Font";
             font-size: 14pt;
             color: #d3d0c8; /* text */
             background-color: rgba(57, 57, 57, 0.5);
         }

         button {
             background-repeat: no-repeat;
             background-position: center;
             background-size: 25%;
             border: none;
             background-color: rgba(57, 57, 57, 0);
             margin: 5px;
             transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
         }

         button:hover {
             background-color: rgba(57, 57, 57, 0.1);
         }

         button:focus {
             background-color: #cc99cc;
             color: #2d2d2d;
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
        @define-color background #2d2d2d;
        @define-color current_line_background #2d2d2d;
        @define-color foreground #a09f93;
        @define-color foreground_lessimportant #a09f93;
        @define-color accent #f99157;
        @define-color highlight #f99157;
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
            "when_selected": "#cc99cc",
            "when_not_selected": "#cc99cc"
          }
        }
      '';
    };
  };
}
