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
    base16Scheme = "${pkgs.base16-schemes}/share/themes/eighties.yaml";
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
    colorscheme = "eighties";
  };

  programs.fish.functions = {
    fish_greeting = "pokeget purrloin --hide-name | fastfetch --file-raw -";
  };
  home.file = {
    ".dotfiles/modules/fastfetch/theme" = {
      executable = true;
      text = ''
        echo Eighties
      '';
    };
  };
  home.file = {
    ".config/hypr/theme.conf" = {
      enable = true;
      text = ''
        $base00 = rgb(2d2d2d)
        $base01 = rgb(393939)
        $base02 = rgb(515151)
        $base03 = rgb(747369)
        $base04 = rgb(a09f93)
        $base05 = rgb(d3d0c8)
        $base06 = rgb(e8e6df)
        $base07 = rgb(f2f0ec)
        $base08 = rgb(f2777a)
        $base09 = rgb(f99157)
        $base0A = rgb(ffcc66)
        $base0B = rgb(99cc99)
        $base0C = rgb(66cccc)
        $base0D = rgb(6699cc)
        $base0E = rgb(cc99cc)
        $base0F = rbg(d27b53)
      '';
    };
  };

  home.file = {
    ".config/waybar/theme.css" = {
      enable = true;
      text = ''
        @define-color base00 #2d2d2d;
        @define-color base01 #393939;
        @define-color base02 #515151;
        @define-color base03 #747369;
        @define-color base04 #a09f93;
        @define-color base05 #d3d0c8; 
        @define-color base06 #e8e6df;
        @define-color base07 #f2f0ec;
        @define-color base08 #f2777a;
        @define-color base09 #f99157;
        @define-color base0A #ffcc66;
        @define-color base0B #99cc99;
        @define-color base0C #66cccc;
        @define-color base0D #6699cc;
        @define-color base0E #cc99cc;
        @define-color base0F #d27b53;
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
