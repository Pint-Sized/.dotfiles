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
    image = ../../wallpapers/gruvbox/village.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-soft.yaml";
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
  programs.nixvim.colorschemes.gruvbox.enable = true;

  programs.fish.functions = {
    fish_greeting = "pokeget roselia --hide-name | fastfetch --file-raw -";
  };
  home.file = {
    ".dotfiles/modules/fastfetch/theme" = {
      executable = true;
      text = ''
        echo "Gruvbox Material Dark Soft"
      '';
    };
  };
  home.file = {
    ".config/hypr/theme.conf" = {
      enable = true;
      text = ''
        $base00 = rgb(32302f)
        $base01 = rgb(3c3836)
        $base02 = rgb(5a524c)
        $base03 = rgb(7c6f64)
        $base04 = rgb(bdae93)
        $base05 = rgb(ddc7a1)
        $base06 = rgb(ebdbb2)
        $base07 = rgb(fbf1c7)
        $base08 = rgb(ea6962)
        $base09 = rgb(e78a4e)
        $base0A = rgb(d8a657)
        $base0B = rgb(d3869b)
        $base0C = rgb(89b482)
        $base0D = rgb(7daea3)
        $base0E = rgb(a9b665)
        $base0F = rbg(bd6f3e)
      '';
    };
  };

  home.file = {
    ".config/waybar/theme.css" = {
      enable = true;
      text = ''
        @define-color base00 #32302f;
        @define-color base01 #3c3836;
        @define-color base02 #5a524c;
        @define-color base03 #7c6f64;
        @define-color base04 #bdae93;
        @define-color base05 #ddc7a1; 
        @define-color base06 #ebdbb2;
        @define-color base07 #fbf1c7;
        @define-color base08 #ea6962;
        @define-color base09 #e78a4e;
        @define-color base0A #d8a657;
        @define-color base0B #a9b665;
        @define-color base0C #89b482;
        @define-color base0D #7daea3;
        @define-color base0E #d3869b;
        @define-color base0F #bd6f3e;
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
