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
    base16Scheme = "${pkgs.base16-schemes}/share/themes/greenscreen.yaml";
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
    colorscheme = "greenscreen";
  };

  programs.fish.functions = {
    fish_greeting = "pokeget axew --hide-name | fastfetch --file-raw -";
  };
  home.file = {
    ".dotfiles/modules/fastfetch/theme" = {
      executable = true;
      text = ''
        echo Greenscreen
      '';
    };
  };
  home.file = {
    ".config/hypr/theme.conf" = {
      enable = true;
      text = ''
        $base00 = rgb(001100)
        $base01 = rgb(003300)
        $base02 = rgb(005500)
        $base03 = rgb(007700)
        $base04 = rgb(009900)
        $base05 = rgb(00bb00)
        $base06 = rgb(00dd00)
        $base07 = rgb(00ff00)
        $base08 = rgb(007700)
        $base09 = rgb(009900)
        $base0A = rgb(007700)
        $base0B = rgb(00bb00)
        $base0C = rgb(005500)
        $base0D = rgb(009900)
        $base0E = rgb(00bb00)
        $base0F = rbg(005500)
      '';
    };
  };

  home.file = {
    ".config/waybar/theme.css" = {
      enable = true;
      text = ''
        @define-color base00 #001100;
        @define-color base01 #003300;
        @define-color base02 #005500;
        @define-color base03 #007700;
        @define-color base04 #009900;
        @define-color base05 #00bb00; 
        @define-color base06 #00dd00;
        @define-color base07 #00ff00;
        @define-color base08 #007700;
        @define-color base09 #009900;
        @define-color base0A #007700;
        @define-color base0B #00bb00;
        @define-color base0C #005500;
        @define-color base0D #009900;
        @define-color base0E #00bb00;
        @define-color base0F #005500;
      '';
    };
  };
  programs.wlogout.style = ''
    window {
             font-family: "0xProto Nerd Font";
             font-size: 14pt;
             color: #00bb00; /* text */
             background-color: rgba(0, 51, 0, 0.5);
         }

         button {
             background-repeat: no-repeat;
             background-position: center;
             background-size: 25%;
             border: none;
             background-color: rgba(0, 51, 0, 0);
             margin: 5px;
             transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
         }

         button:hover {
             background-color: rgba(0, 51, 0, 0.1);
         }

         button:focus {
             background-color: #00bb00;
             color: #001100;
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
