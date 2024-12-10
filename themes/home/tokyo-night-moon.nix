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
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
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
    colorscheme = "tokyo-night-dark";
  };

  programs.fish.functions = {
    fish_greeting = "pokeget lunatone --hide-name | fastfetch --file-raw -";
  };
  home.file = {
    ".dotfiles/modules/fastfetch/theme" = {
      executable = true;
      text = ''
        echo "Tokyo Night Dark"
      '';
    };
  };
  home.file = {
    ".config/hypr/theme.conf" = {
      enable = true;
      text = ''
        $base00 = rgb(222436)
        $base01 = rgb(1e2030)
        $base02 = rgb(2d3f76)
        $base03 = rgb(636da6)
        $base04 = rgb(828bb8)
        $base05 = rgb(3b4261)
        $base06 = rgb(828bb8)
        $base07 = rgb(c8d3f5)
        $base08 = rgb(ff757f)
        $base09 = rgb(ffc777)
        $base0A = rgb(ffc777)
        $base0B = rgb(c3e88d)
        $base0C = rgb(86e1fc)
        $base0D = rgb(82aaff)
        $base0E = rgb(fca7ea)
        $base0F = rbg(c53b53)
      '';
    };
  };

  home.file = {
    ".config/waybar/theme.css" = {
      enable = true;
      text = ''
        @define-color base00 #222436;
        @define-color base01 #1e2030;
        @define-color base02 #2d3f76;
        @define-color base03 #636da6;
        @define-color base04 #828bb8;
        @define-color base05 #3b4261; 
        @define-color base06 #828bb8;
        @define-color base07 #c8d3f5;
        @define-color base08 #ff757f;
        @define-color base09 #ffc777;
        @define-color base0A #ffc777;
        @define-color base0B #c3e88d;
        @define-color base0C #86e1fc;
        @define-color base0D #82aaff;
        @define-color base0E #fca7ea;
        @define-color base0F #c53b53;
      '';
    };
  };
  programs.wlogout.style = ''
    window {
             font-family: "0xProto Nerd Font";
             font-size: 14pt;
             color: #3b4261; /* text */
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
             background-color: #fca7ea;
             color: #222436;
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
