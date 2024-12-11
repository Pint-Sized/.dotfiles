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
    base16Scheme = "${pkgs.base16-schemes}/share/themes/phd.yaml";
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
    colorscheme = "phd";
  };

  programs.fish.functions = {
    fish_greeting = "pokeget purrloin --hide-name | fastfetch --file-raw -";
  };
  home.file = {
    ".dotfiles/modules/fastfetch/theme" = {
      executable = true;
      text = ''
        echo PHD
      '';
    };
  };
  home.file = {
    ".config/hypr/theme.conf" = {
      enable = true;
      text = ''
        $base00 = rgb(061229)
        $base01 = rgb(2a3448)
        $base02 = rgb(4d5666)
        $base03 = rgb(717885)
        $base04 = rgb(9a99a3)
        $base05 = rgb(b8bbc2)
        $base06 = rgb(dbdde0)
        $base07 = rgb(ffffff)
        $base08 = rgb(d07346)
        $base09 = rgb(f0a000)
        $base0A = rgb(fbd461)
        $base0B = rgb(99bf52)
        $base0C = rgb(72b9bf)
        $base0D = rgb(5299bf)
        $base0E = rgb(9989cc)
        $base0F = rbg(b08060)
      '';
    };
  };

  home.file = {
    ".config/waybar/theme.css" = {
      enable = true;
      text = ''
        @define-color base00 #061229;
        @define-color base01 #2a3448;
        @define-color base02 #4d5666;
        @define-color base03 #717885;
        @define-color base04 #9a99a3;
        @define-color base05 #b8bbc2; 
        @define-color base06 #dbdde0;
        @define-color base07 #ffffff;
        @define-color base08 #d07346;
        @define-color base09 #f0a000;
        @define-color base0A #fbd461;
        @define-color base0B #99bf52;
        @define-color base0C #72b9bf;
        @define-color base0D #5299bf;
        @define-color base0E #9989cc;
        @define-color base0F #b08060;
      '';
    };
  };
  programs.wlogout.style = ''
    window {
             font-family: "0xProto Nerd Font";
             font-size: 14pt;
             color: #b8bbc2; /* text */
             background-color: rgba(42, 52, 72, 0.5);
         }

         button {
             background-repeat: no-repeat;
             background-position: center;
             background-size: 25%;
             border: none;
             background-color: rgba(42, 52, 72, 0);
             margin: 5px;
             transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
         }

         button:hover {
             background-color: rgba(42, 52, 72, 0.1);
         }

         button:focus {
             background-color: #9989cc;
             color: #061229;
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
