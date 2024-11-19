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
    base16Scheme = "${pkgs.base16-schemes}/share/themes/horizon-terminal-dark.yaml";
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
    };
  };
  programs.nixvim.colorschemes.base16 = {
    enable = true;
    colorscheme = "horizon-terminal-dark";
  };

  programs.fish.functions = {
    fish_greeting = "pokeget purrloin --hide-name | fastfetch --file-raw -";
  };
  home.file = {
    ".dotfiles/modules/fastfetch/theme" = {
      executable = true;
      text = ''
        echo "Horizon Terminal Dark"
      '';
    };
  };
  home.file = {
    ".config/hypr/theme.conf" = {
      enable = true;
      text = ''
        $base00 = rgb(1C1E26)
        $base01 = rgb(232530)
        $base02 = rgb(2E303E)
        $base03 = rgb(6F6F70)
        $base04 = rgb(9DA0A2)
        $base05 = rgb(CBCED0)
        $base06 = rgb(DCDFE4)
        $base07 = rgb(E3E6EE)
        $base08 = rgb(E95678)
        $base09 = rgb(FAB795)
        $base0A = rgb(FAC29A)
        $base0B = rgb(29D398)
        $base0C = rgb(59E1E3)
        $base0D = rgb(26BBD9)
        $base0E = rgb(EE64AC)
        $base0F = rbg(F09383)
      '';
    };
  };

  home.file = {
    ".config/waybar/theme.css" = {
      enable = true;
      text = ''
        @define-color base00 #1C1E26;
        @define-color base01 #232530;
        @define-color base02 #2E303E;
        @define-color base03 #6F6F70;
        @define-color base04 #9DA0A2;
        @define-color base05 #CBCED0; 
        @define-color base06 #DCDFE4;
        @define-color base07 #E3E6EE;
        @define-color base08 #E95678;
        @define-color base09 #FAB795;
        @define-color base0A #FAC29A;
        @define-color base0B #29D398;
        @define-color base0C #59E1E3;
        @define-color base0D #26BBD9;
        @define-color base0E #EE64AC;
        @define-color base0F #F09383;
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
