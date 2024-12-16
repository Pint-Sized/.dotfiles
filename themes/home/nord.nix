{ stylix, config, pkgs, pkgs-unstable, lib, ... }:

{
  stylix = {
    enable = true;
    image = ../../wallpapers/evening-sky.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
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
      sizes = { terminal = 10; };
    };
    targets = {
      hyprland.enable = false;
      waybar.enable = false;
      hyprlock.enable = false;
    };
  };
  programs.nixvim.colorschemes.nord.enable = true;

  programs.fish.functions = {
    fish_greeting = "pokeget oddish --hide-name | fastfetch --file-raw -";
  };
  home.file = {
    ".dotfiles/modules/fastfetch/theme" = {
      executable = true;
      text = ''
        echo Nord
      '';
    };
  };
  home.file = {
    ".config/hypr/theme.conf" = {
      enable = true;
      text = ''
        $base00 = rgb(2E3440)
        $base01 = rgb(3B4252)
        $base02 = rgb(434C5E)
        $base03 = rgb(4C566A)
        $base04 = rgb(D8DEE9)
        $base05 = rgb(E5E9F0)
        $base06 = rgb(ECEFF4)
        $base07 = rgb(8FBCBB)
        $base08 = rgb(BF616A)
        $base09 = rgb(D08770)
        $base0A = rgb(EBCB8B)
        $base0B = rgb(A3BE8C)
        $base0C = rgb(B48EAD)
        $base0D = rgb(81A1C1)
        $base0E = rgb(88C0D0)
        $base0F = rbg(5E81AC)
      '';
    };
  };

  home.file = {
    ".config/waybar/theme.css" = {
      enable = true;
      text = ''
        @define-color base00 #2E3440;
        @define-color base01 #3B4252;
        @define-color base02 #434C5E;
        @define-color base03 #4C566A;
        @define-color base04 #D8DEE9;
        @define-color base05 #E5E9F0; 
        @define-color base06 #ECEFF4;
        @define-color base07 #8FBCBB;
        @define-color base08 #BF616A;
        @define-color base09 #D08770;
        @define-color base0A #EBCB8B;
        @define-color base0B #A3BE8C;
        @define-color base0C #D8DEE9;
        @define-color base0D #81A1C1;
        @define-color base0E #B48EAD;
        @define-color base0F #5E81AC;
      '';
    };
  };
  programs.wlogout.style = ''
    window {
             font-family: "0xProto Nerd Font";
             font-size: 14pt;
             color: #E5E9F0; /* text */
             background-color: rgba(59, 66, 82, 0.5);
         }

         button {
             background-repeat: no-repeat;
             background-position: center;
             background-size: 25%;
             border: none;
             background-color: rgba(59 66, 82, 0);
             margin: 5px;
             transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
         }

         button:hover {
             background-color: rgba(59, 66, 82, 0.1);
         }

         button:focus {
             background-color: #88C0D0;
             color: #2E3440;
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
