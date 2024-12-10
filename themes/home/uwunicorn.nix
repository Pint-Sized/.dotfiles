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
    base16Scheme = "${pkgs.base16-schemes}/share/themes/uwunicorn.yaml";
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
    colorscheme = "uwunicorn";
  };

  programs.fish.functions = {
    fish_greeting = "pokeget purrloin --hide-name | fastfetch --file-raw -";
  };
  home.file = {
    ".dotfiles/modules/fastfetch/theme" = {
      executable = true;
      text = ''
        echo "uwunicorn"
      '';
    };
  };
  home.file = {
    ".config/hypr/theme.conf" = {
      enable = true;
      text = ''
        $base00 = rgb(241b26)
        $base01 = rgb(2f2a3f)
        $base02 = rgb(46354a)
        $base03 = rgb(6c3cb2)
        $base04 = rgb(7e5f83)
        $base05 = rgb(eed5d9)
        $base06 = rgb(d9c2c6)
        $base07 = rgb(e4ccd0)
        $base08 = rgb(877bb6)
        $base09 = rgb(de5b44)
        $base0A = rgb(a84a73)
        $base0B = rgb(78a38f)
        $base0C = rgb(9c5fce)
        $base0D = rgb(6a9eb5)
        $base0E = rgb(c965bf)
        $base0F = rbg(a3a079)
      '';
    };
  };

  home.file = {
    ".config/waybar/theme.css" = {
      enable = true;
      text = ''
        @define-color base00 #241b26;
        @define-color base01 #2f2a3f;
        @define-color base02 #46354a;
        @define-color base03 #6c3cb2;
        @define-color base04 #7e5f83;
        @define-color base05 #eed5d9; 
        @define-color base06 #d9c2c6;
        @define-color base07 #e4ccd0;
        @define-color base08 #877bb6;
        @define-color base09 #de5b44;
        @define-color base0A #a84a73;
        @define-color base0B #c965bf;
        @define-color base0C #9c5fce;
        @define-color base0D #6a9eb5;
        @define-color base0E #78a38f;
        @define-color base0F #a3a079;
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
}
