{
  stylix,
  config,
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:

{
  stylix = {
    enable = true;
    image = ../../wallpapers/evening-sky.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/pinky.yaml";
    cursor = {
      name = "catppuccin-mocha-mauve-cursors";
      package = pkgs.catppuccin-cursors.mochaMauve;
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
        name = "0xProto Nerd Font";
      };
      sizes = {
        terminal = 11;
      };
    };
    targets = {
      hyprland.enable = false;
      waybar.enable = false;
    };
  };
  programs.nixvim.colorschemes.base16 = {
    enable = true;
    colorscheme = "pinky";
  };

  programs.fish.functions = {
    fish_greeting = "pokeget purrloin --hide-name | fastfetch --file-raw -";
  };

  home.file = {
    ".config/hypr/theme.conf" = {
      enable = true;
      text = ''
        $base00 = rgb(171517)
        $base01 = rgb(1b181b)
        $base02 = rgb(1d1b1d)
        $base03 = rgb(383338)
        $base04 = rgb(e7dbdb)
        $base05 = rgb(f5f5f5)
        $base06 = rgb(ffffff)
        $base07 = rgb(f7f3f7)
        $base08 = rgb(ffa600)
        $base09 = rgb(00ff66)
        $base0A = rgb(20df6c)
        $base0B = rgb(ff0066)
        $base0C = rgb(6600ff)
        $base0D = rgb(00ffff)
        $base0E = rgb(007fff)
        $base0F = rbg(df206c)
      '';
    };
  };

  home.file = {
    ".config/waybar/theme.css" = {
      enable = true;
      text = ''
        @define-color base00 #171517;
        @define-color base01 #1b181b;
        @define-color base02 #1d1b1d;
        @define-color base03 #383338;
        @define-color base04 #e7dbdb;
        @define-color base05 #f5f5f5; 
        @define-color base06 #ffffff;
        @define-color base07 #f7f3f7;
        @define-color base08 #ffa600;
        @define-color base09 #00ff66;
        @define-color base0A #20df6c;
        @define-color base0B #ff0066;
        @define-color base0C #6600ff;
        @define-color base0D #00ffff;
        @define-color base0E #007fff;
        @define-color base0F #df206c;
      '';
    };
  };
  programs.wlogout.style = ''
    window {
             font-family: "0xProto Nerd Font";
             font-size: 14pt;
             color: #ddc7a1; /* text */
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
             background-color: #a9b665;
             color: #32302f;
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
