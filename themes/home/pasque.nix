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
    base16Scheme = "${pkgs.base16-schemes}/share/themes/pasque.yaml";
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
        name = "0xProto Nerd Font";
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
    colorscheme = "pasque";
  };

  programs.fish.functions = {
    fish_greeting = "pokeget purrloin --hide-name | fastfetch --file-raw -";
  };
  home.file = {
    ".dotfiles/modules/fastfetch/theme" = {
      executable = true;
      text = ''
        echo Pasque
      '';
    };
  };
  home.file = {
    ".config/hypr/theme.conf" = {
      enable = true;
      text = ''
        $base00 = rgb(271C3A)
        $base01 = rgb(100323)
        $base02 = rgb(3E2D5C)
        $base03 = rgb(5D5766)
        $base04 = rgb(BEBCBF)
        $base05 = rgb(DEDCDF)
        $base06 = rgb(EDEAEF)
        $base07 = rgb(BBAADD)
        $base08 = rgb(A92258)
        $base09 = rgb(918889)
        $base0A = rgb(804ead)
        $base0B = rgb(C6914B)
        $base0C = rgb(7263AA)
        $base0D = rgb(8E7DC6)
        $base0E = rgb(953B9D)
        $base0F = rbg(59325C)
      '';
    };
  };

  home.file = {
    ".config/waybar/theme.css" = {
      enable = true;
      text = ''
        @define-color base00 #271C3A;
        @define-color base01 #100323;
        @define-color base02 #3E2D5C;
        @define-color base03 #5D5766;
        @define-color base04 #BEBCBF;
        @define-color base05 #DEDCDF; 
        @define-color base06 #EDEAEF;
        @define-color base07 #BBAADD;
        @define-color base08 #A92258;
        @define-color base09 #918889;
        @define-color base0A #804ead;
        @define-color base0B #C6914B;
        @define-color base0C #7263AA;
        @define-color base0D #8E7DC6;
        @define-color base0E #953B9D;
        @define-color base0F #59325C;
      '';
    };
  };
  programs.wlogout.style = ''
    window {
             font-family: "0xProto Nerd Font";
             font-size: 14pt;
             color: #DEDCDF; /* text */
             background-color: rgba(16, 3, 35, 0.5);
         }

         button {
             background-repeat: no-repeat;
             background-position: center;
             background-size: 25%;
             border: none;
             background-color: rgba(16, 3, 35, 0);
             margin: 5px;
             transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
         }

         button:hover {
             background-color: rgba(16, 3, 35, 0.1);
         }

         button:focus {
             background-color: #953B9D;
             color: #271C3A;
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
