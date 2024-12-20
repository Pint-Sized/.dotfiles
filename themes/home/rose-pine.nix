{ pkgs, ... }:

{
  stylix = {
    enable = true;
    image = ../../wallpapers/evening-sky.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
    cursor = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 16;
    };
    fonts = {
      serif = {
        package = pkgs.nerdfonts;
        name = "0xProto Nerd Font";
      };
      sansSerif = {
        package = pkgs.nerdfonts;
        name = "0xProto Nerd Font";
      };
      monospace = {
        package = pkgs.nerdfonts;
        name = "0xProto Nerd Font Mono";
      };
      sizes = {
        terminal = 10;
      };
    };
    targets = {
      hyprland.enable = false;
      waybar.enable = false;
      hyprlock.enable = false;
    };
  };
  programs.nixvim.colorschemes.base16 = {
    enable = true;
    colorscheme = "rose-pine";
  };

  programs.fish.functions = {
    fish_greeting = "pokeget purrloin --hide-name | fastfetch --file-raw -";
  };
  home.file = {
    ".dotfiles/modules/fastfetch/theme" = {
      executable = true;
      text = ''
        echo "Rosé Pine"
      '';
    };
  };
  home.file = {
    ".config/hypr/theme.conf" = {
      enable = true;
      text = ''
        $base00 = rgb(191724)
        $base01 = rgb(1f1d2e)
        $base02 = rgb(26233a)
        $base03 = rgb(6e6a86)
        $base04 = rgb(908caa)
        $base05 = rgb(e0def4)
        $base06 = rgb(e0def4)
        $base07 = rgb(524f67)
        $base08 = rgb(eb6f92)
        $base09 = rgb(f6c177)
        $base0A = rgb(ebbcba)
        $base0B = rgb(31748f)
        $base0C = rgb(9ccfd8)
        $base0D = rgb(c4a7e7)
        $base0E = rgb(f6c177)
        $base0F = rbg(524f67)
      '';
    };
  };

  home.file = {
    ".config/waybar/theme.css" = {
      enable = true;
      text = ''
        @define-color base00 #191724;
        @define-color base01 #1f1d2e;
        @define-color base02 #26233a;
        @define-color base03 #6e6a86;
        @define-color base04 #908caa;
        @define-color base05 #e0def4; 
        @define-color base06 #e0def4;
        @define-color base07 #524f67;
        @define-color base08 #eb6f92;
        @define-color base09 #f6c177;
        @define-color base0A #ebbcba;
        @define-color base0B #31748f;
        @define-color base0C #9ccfd8;
        @define-color base0D #78a38f;
        @define-color base0E #f6c177;
        @define-color base0F #524f67;
      '';
    };
  };
  programs.wlogout.style = ''
    window {
             font-family: "0xProto Nerd Font";
             font-size: 14pt;
             color: #e0def4; /* text */
             background-color: rgba(31, 29, 46, 0.5);
         }

         button {
             background-repeat: no-repeat;
             background-position: center;
             background-size: 25%;
             border: none;
             background-color: rgba(31, 29, 46, 0);
             margin: 5px;
             transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
         }

         button:hover {
             background-color: rgba(31, 29, 46, 0.1);
         }

         button:focus {
             background-color: #f6c177;
             color: #191724;
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
        @define-color background #191724;
        @define-color current_line_background #1f1d2e;
        @define-color foreground #908caa;
        @define-color foreground_lessimportant #908caa;
        @define-color accent #f6c177;
        @define-color highlight #f6c177;
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
            "when_selected": "#31748f",
            "when_not_selected": "#31748f"
          }
        }
      '';
    };
  };
}
