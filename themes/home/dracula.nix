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
    base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
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
  programs.nixvim.colorschemes.dracula-nvim.enable = true;

  programs.fish.functions = {
    fish_greeting = "pokeget houndoom --hide-name | fastfetch --file-raw -";
  };
  home.file = {
    ".dotfiles/modules/fastfetch/theme" = {
      executable = true;
      text = ''
        echo Dracula
      '';
    };
  };
  home.file = {
    ".config/hypr/theme.conf" = {
      enable = true;
      text = ''
        $base00 = rgb(282a36)
        $base01 = rgb(363447)
        $base02 = rgb(44475a)
        $base03 = rgb(6272a4)
        $base04 = rgb(9ea8c7)
        $base05 = rgb(f8f8f2)
        $base06 = rgb(f0f1f4)
        $base07 = rgb(ffffff)
        $base08 = rgb(ff5555)
        $base09 = rgb(ffb86c)
        $base0A = rgb(f1fa8c)
        $base0B = rgb(50fa7b)
        $base0C = rgb(8be9fd)
        $base0D = rgb(80bfff)
        $base0E = rgb(ff79c6)
        $base0F = rbg(bd93f9)
      '';
    };
  };

  home.file = {
    ".config/waybar/theme.css" = {
      enable = true;
      text = ''
        @define-color base00 #282a36;
        @define-color base01 #363447;
        @define-color base02 #44475a;
        @define-color base03 #6272a4;
        @define-color base04 #9ea8c7;
        @define-color base05 #f8f8f2;
        @define-color base06 #f0f1f4;
        @define-color base07 #ffffff;
        @define-color base08 #ff5555;
        @define-color base09 #ffb86c;
        @define-color base0A #f1fa8c;
        @define-color base0B #50fa7b;
        @define-color base0C #8be9fd;
        @define-color base0D #80bfff;
        @define-color base0E #ff79c6;
        @define-color base0F #bd93f9;
      '';
    };
  };
  programs.wlogout.style = ''
    window {
             font-family: "0xProto Nerd Font";
             font-size: 14pt;
             color: #f8f8f2; /* text */
             background-color: rgba(54, 52, 71, 0.5);
         }

         button {
             background-repeat: no-repeat;
             background-position: center;
             background-size: 25%;
             border: none;
             background-color: rgba(54, 52, 71, 0);
             margin: 5px;
             transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
         }

         button:hover {
             background-color: rgba(54, 52, 71, 0.1);
         }

         button:focus {
             background-color: #bd93f9;
             color: #282a36;
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
