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
    base16Scheme = "${pkgs.base16-schemes}/share/themes/xcode-dusk.yaml";
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
      hyprlock.enable = false;
    };
  };
  programs.nixvim.colorschemes.base16 = {
    enable = true;
    colorscheme = "xcode-dusk";
  };

  programs.fish.functions = {
    fish_greeting = "pokeget shuppet --hide-name | fastfetch --file-raw -";
  };
  home.file = {
    ".dotfiles/modules/fastfetch/theme" = {
      executable = true;
      text = ''
        echo "XCode Dusk"
      '';
    };
  };
  home.file = {
    ".config/hypr/theme.conf" = {
      enable = true;
      text = ''
        $base00 = rgb(282B35)
        $base01 = rgb(3D4048)
        $base02 = rgb(53555D)
        $base03 = rgb(686A71)
        $base04 = rgb(7E8086)
        $base05 = rgb(939599)
        $base06 = rgb(A9AAAE)
        $base07 = rgb(BEBFC2)
        $base08 = rgb(B21889)
        $base09 = rgb(786DC5)
        $base0A = rgb(438288)
        $base0B = rgb(DF0002)
        $base0C = rgb(00A0BE)
        $base0D = rgb(790EAD)
        $base0E = rgb(B21889)
        $base0F = rbg(C77C48)
      '';
    };
  };

  home.file = {
    ".config/waybar/theme.css" = {
      enable = true;
      text = ''
        @define-color base00 #282B35;
        @define-color base01 #3D4048;
        @define-color base02 #53555D;
        @define-color base03 #686A71;
        @define-color base04 #7E8086;
        @define-color base05 #939599; 
        @define-color base06 #A9AAAE;
        @define-color base07 #BEBFC2;
        @define-color base08 #B21889;
        @define-color base09 #786DC5;
        @define-color base0A #438288;
        @define-color base0B #DF0002;
        @define-color base0C #00A0BE;
        @define-color base0D #790EAD;
        @define-color base0E #B21889;
        @define-color base0F #C77C48;
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
