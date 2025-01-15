{ pkgs, ... }:

{
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/heetch.yaml";

  programs.nixvim.colorschemes.base16 = {
    enable = true;
    colorscheme = "heetch";
  };

  programs.fish.functions = {
    fish_greeting = "pokeget purrloin --hide-name | fastfetch --file-raw -";
  };
  home.file = {
    ".dotfiles/modules/fastfetch/theme" = {
      executable = true;
      text = ''
        echo "heetch"
      '';
    };
  };
  home.file = {
    ".config/hypr/theme.conf" = {
      enable = true;
      text = ''
        $base00 = rgb(190134)
        $base01 = rgb(392551)
        $base02 = rgb(5A496E)
        $base03 = rgb(7B6D8B)
        $base04 = rgb(9C92A8)
        $base05 = rgb(BDB6C5)
        $base06 = rgb(DEDAE2)
        $base07 = rgb(FEFFFF)
        $base08 = rgb(27D9D5)
        $base09 = rgb(5BA2B6)
        $base0A = rgb(8F6C97)
        $base0B = rgb(C33678)
        $base0C = rgb(F80059)
        $base0D = rgb(BD0152)
        $base0E = rgb(82034C)
        $base0F = rbg(470546)
      '';
    };
  };

  home.file = {
    ".config/waybar/theme.css" = {
      enable = true;
      text = ''
        @define-color base00 #190134;
        @define-color base01 #392551;
        @define-color base02 #5A496E;
        @define-color base03 #7B6D8B;
        @define-color base04 #9C92A8;
        @define-color base05 #BDB6C5; 
        @define-color base06 #DEDAE2;
        @define-color base07 #FEFFFF;
        @define-color base08 #27D9D5;
        @define-color base09 #5BA2B6;
        @define-color base0A #8F6C97;
        @define-color base0B #C33678;
        @define-color base0C #F80059;
        @define-color base0D #BD0152;
        @define-color base0E #82034C;
        @define-color base0F #470546;
      '';
    };
  };
  programs.wlogout.style = ''
    window {
             font-family: "0xProto Nerd Font";
             font-size: 14pt;
             color: #eed5d9; /* text */
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
             background-color: #c965bf;
             color: #241b26;
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
        @define-color background #241b26;
        @define-color current_line_background #2f2a3f;
        @define-color foreground #7e5f83;
        @define-color foreground_lessimportant #eed5d9;
        @define-color accent #de5b44;
        @define-color highlight #de5b44;
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
            "when_selected": "#78a38f",
            "when_not_selected": "#78a385"
          }
        }
      '';
    };
  };
}
