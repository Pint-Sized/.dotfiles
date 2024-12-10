{
  stylix,
  config,
  pkgs,
  pkgs-unstable,
  lib,
  catppuccin,
  ...
}:

{
  stylix = {
    enable = true;
    image = ../../wallpapers/evening-sky.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
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
        terminal = 11;
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
    colorscheme = "catppuccin-mocha";
  };

  programs.fish.functions = {
    fish_greeting = "pokeget ducklett --hide-name | fastfetch --file-raw -";
  };

  home.file = {
    ".dotfiles/modules/fastfetch/theme" = {
      executable = true;
      text = ''
        echo "Catppuccin Mocha"
      '';
    };
  };

  home.file = {
    ".config/hypr/theme.conf" = {
      enable = true;
      text = ''
        $base00 = rgb(1e1e2e)
        $base01 = rgb(181825)
        $base02 = rgb(313244)
        $base03 = rgb(45475a)
        $base04 = rgb(585b70)
        $base05 = rgb(cdd6f4)
        $base06 = rgb(f5e0dc)
        $base07 = rgb(b4befe)
        $base08 = rgb(f38ba8)
        $base09 = rgb(fab387)
        $base0A = rgb(f9e2af)
        $base0B = rgb(a6e3a1)
        $base0C = rgb(94e2d5)
        $base0D = rgb(89b4fa)
        $base0E = rgb(cba6f7)
        $base0F = rbg(f2cdcd)
      '';
    };
  };

  home.file = {
    ".config/waybar/theme.css" = {
      enable = true;
      text = ''
        @define-color base00 #1e1e2e;
        @define-color base01 #181825;
        @define-color base02 #313244;
        @define-color base03 #45475a;
        @define-color base04 #585b70;
        @define-color base05 #cdd6f4; 
        @define-color base06 #f5e0dc;
        @define-color base07 #b4befe;
        @define-color base08 #f38ba8;
        @define-color base09 #fab387;
        @define-color base0A #f9e2af;
        @define-color base0B #a6e3a1;
        @define-color base0C #94e2d5;
        @define-color base0D #89b4fa;
        @define-color base0E #cba6f7;
        @define-color base0F #f2cdcd;
      '';
    };
  };
  programs.wlogout.style = ''
    window {
             font-family: "0xProto Nerd Font";
             font-size: 14pt;
             color: #cdd6f4; /* text */
             background-color: rgba(60, 56, 54, 0.5);
         }

         button {
             background-repeat: no-repeat;
             background-position: center;
             background-size: 25%;
             border: none;
             background-color: rgba(60, 56, 54, 0);
             margin: 5px;
             transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
         }

         button:hover {
             background-color: rgba(60, 56, 54, 0.1);
         }

         button:focus {
             background-color: #cba6f7;
             color: #1e1e2e;
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
}
