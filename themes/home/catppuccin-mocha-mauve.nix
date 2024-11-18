{
  config,
  pkgs,
  catppuccin,
  lib,
  ...
}:

{
  catppuccin = {
    enable = true;
    accent = "mauve";
    flavor = "mocha";
    pointerCursor = {
      enable = true;
      accent = "mauve";
      flavor = "mocha";
    };
  };
  programs.bat.catppuccin = {
    enable = true;
    flavor = "mocha";
  };
  programs.btop.catppuccin = {
    enable = true;
    flavor = "mocha";
  };
  programs.cava.catppuccin = {
    enable = true;
    flavor = "mocha";
    transparent = true;
  };
  programs.fzf.catppuccin = {
    enable = true;
    accent = "mauve";
    flavor = "mocha";
  };
  gtk = {
    catppuccin = {
      enable = true;
      accent = "mauve";
      flavor = "mocha";
      icon = {
        enable = true;
        accent = "mauve";
        flavor = "mocha";
      };
    };
    cursorTheme = {
      size = 10;
      name = "catppuccin-mocha-mauve-cursors";
      package = pkgs.catppuccin-cursors.mochaMauve;
    };
  };
  wayland.windowManager.hyprland.catppuccin.enable = false;

  programs.fish.functions = {
    fish_greeting = "pokeget nidoran-m --hide-name | fastfetch --file-raw -";
  };

  programs.hyprlock.catppuccin = {
    enable = true;
    accent = "mauve";
    flavor = "mocha";
  };
  programs.imv.catppuccin = {
    enable = true;
    flavor = "mocha";
  };
  programs.mpv.catppuccin = {
    enable = true;
    accent = "mauve";
    flavor = "mocha";
  };
  programs.obs-studio.catppuccin = {
    enable = true;
    flavor = "mocha";
  };
  qt.style.catppuccin = {
    accent = "mauve";
    flavor = "mocha";
    apply = true;
  };
  programs.waybar.catppuccin = {
    enable = true;
    flavor = "mocha";
    mode = "createLink";
  };
  programs.zathura.catppuccin = {
    enable = true;
    flavor = "mocha";
  };
  programs.nixvim.colorschemes.catppuccin = {
    enable = true;
    flavour = "mocha";
  };
  home.file = {
    ".config/hypr/theme.conf" = {
      enable = true;
      text = ''
        $base00 = rgb(1e1e2e) # base
        $base01 = rgb(181825) # mantle
        $base02 = rgb(313244) # surface0
        $base03 = rgb(45475a) # surface1
        $base04 = rgb(585b70) # surface2
        $base05 = rgb(cdd6f4) # text
        $base06 = rgb(f5e0dc) # rosewater
        $base07 = rgb(b4befe) # lavender
        $base08 = rgb(f38ba8) # red
        $base09 = rgb(fab387) # peach
        $base0A = rgb(f9e2af) # yellow
        $base0B = rgb(a6e3a1) # green
        $base0C = rgb(94e2d5) # teal
        $base0D = rgb(89b4fa) # blue
        $base0E = rgb(cba6f7) # mauve
        $base0F = rgb(f2cdcd) # flamingo
      '';
    };
  };

  home.file = {
    ".config/waybar/theme.css" = {
      text = ''
        @define-color base00 #1e1e2e;
        @define-color base01 #181825;
        @define-color base02 #313244;
        @define-color base03 #45475a;
        @define-color base04 #585b70;
        @define-color base05 #cdd6f4;
        @define-color base06 #f5e0dc;
        @define-color base07 #b4befe;
        @define-color base08 #f38ba8; 
        @define-color base09 #fab387;
        @define-color base0A #f9e2af;
        @define-color base0B #a6e3a1;
        @define-color base0C #94e2d5;
        @define-color base0D #89b4fa;
        @define-color base0E #cba6f7;
        @define-color base0F #f2cdcd;
      '';
    };
  };
  programs.wlogout.style = ''
    window {
             font-family: "0xProto Nerd Font";
             font-size: 14pt;
             color: #cdd6f4; /* text */
             background-color: rgba(30, 30, 46, 0.5);
         }

         button {
             background-repeat: no-repeat;
             background-position: center;
             background-size: 25%;
             border: none;
             background-color: rgba(30, 30, 46, 0);
             margin: 5px;
             transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
         }

         button:hover {
             background-color: rgba(49, 50, 68, 0.1);
         }

         button:focus {
             background-color: #cba6f7;
             color: #1e1e2e;
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
