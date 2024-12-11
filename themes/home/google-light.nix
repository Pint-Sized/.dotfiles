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
    base16Scheme = "${pkgs.base16-schemes}/share/themes/google-light.yaml";
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
    colorscheme = "google-light";
  };

  programs.fish.functions = {
    fish_greeting = "pokeget minccino --hide-name | fastfetch --file-raw -";
  };
  home.file = {
    ".dotfiles/modules/fastfetch/theme" = {
      executable = true;
      text = ''
        echo "Google Light"
      '';
    };
  };
  home.file = {
    ".config/hypr/theme.conf" = {
      enable = true;
      text = ''
        $base00 = rgb(ffffff)
        $base01 = rgb(e0e0e0)
        $base02 = rgb(c5c8c6)
        $base03 = rgb(b4b7b4)
        $base04 = rgb(969896)
        $base05 = rgb(373b41)
        $base06 = rgb(282a2e)
        $base07 = rgb(1d1f21)
        $base08 = rgb(CC342B)
        $base09 = rgb(F96A38)
        $base0A = rgb(FBA922)
        $base0B = rgb(198844)
        $base0C = rgb(3971ED)
        $base0D = rgb(3971ED)
        $base0E = rgb(A36AC7)
        $base0F = rbg(3971ED)
      '';
    };
  };

  home.file = {
    ".config/waybar/theme.css" = {
      enable = true;
      text = ''
        @define-color base00 #ffffff;
        @define-color base01 #e0e0e0;
        @define-color base02 #c5c8c6;
        @define-color base03 #b4b7b4;
        @define-color base04 #969896;
        @define-color base05 #373b41; 
        @define-color base06 #282a2e;
        @define-color base07 #1d1f21;
        @define-color base08 #CC342B;
        @define-color base09 #F96A38;
        @define-color base0A #FBA922;
        @define-color base0B #198844;
        @define-color base0C #3971ED;
        @define-color base0D #3971ED;
        @define-color base0E #A36AC7;
        @define-color base0F #3971ED;
      '';
    };
  };
  programs.wlogout.style = ''
    window {
             font-family: "0xProto Nerd Font";
             font-size: 14pt;
             color: #373b41; /* text */
             background-color: rgba(224, 224, 224, 0.5);
         }

         button {
             background-repeat: no-repeat;
             background-position: center;
             background-size: 25%;
             border: none;
             background-color: rgba(224, 224, 224, 0);
             margin: 5px;
             transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
         }

         button:hover {
             background-color: rgba(224, 224, 224, 0.1);
         }

         button:focus {
             background-color: #A36AC7;
             color: #ffffff;
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
