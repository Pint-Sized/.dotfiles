{ config, pkgs, catppuccin, lib, ... }:

{
 catppuccin  = {
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
    home.pointerCursor = {
      name = "catppuccin-mocha-mauve-cursors";
      x11 = {
        enable = true;
        defaultCursor = "catppuccin-mocha-mauve-cursors";
      };
    };
    wayland.windowManager.hyprland.catppuccin.enable = false;

  home.file = {
    ".config/hypr/theme.conf" = {
      text = ''

        $rosewater = rgb(f5e0dc)
        $rosewaterAlpha = f5e0dc

        $flamingo = rgb(f2cdcd)
        $flamingoAlpha = f2cdcd

        $pink = rgb(f5c2e7)
        $pinkAlpha = f5c2e7

        $mauve = rgb(cba6f7)
        $mauveAlpha = cba6f7

        $red = rgb(f38ba8)
        $redAlpha = f38ba8

        $maroon = rgb(eba0ac)
        $maroonAlpha = eba0ac

        $peach = rgb(fab387)
        $peachAlpha = fab387

        $yellow = rgb(f9e2af)
        $yellowAlpha = f9e2af

        $green = rgb(a6e3a1)
        $greenAlpha = a6e3a1

        $teal = rgb(94e2d5)
        $tealAlpha = 94e2d5

        $sky = rgb(89dceb)
        $skyAlpha = 89dceb

        $sapphire = rgb(74c7ec)
        $sapphireAlpha = 74c7ec

        $blue = rgb(89b4fa)
        $blueAlpha = 89b4fa

        $lavender = rgb(b4befe)
        $lavenderAlpha = b4befe

        $text = rgb(cdd6f4)
        $textAlpha = cdd6f4

        $subtext1 = rgb(bac2de)
        $subtext1Alpha = bac2de

        $subtext0 = rgb(a6adc8)
        $subtext0Alpha = a6adc8

        $overlay2 = rgb(9399b2)
        $overlay2Alpha = 9399b2

        $overlay1 = rgb(7f849c)
        $overlay1Alpha = 7f849c

        $overlay0 = rgb(6c7086)
        $overlay0Alpha = 6c7086

        $surface2 = rgb(585b70)
        $surface2Alpha = 585b70

        $surface1 = rgb(45475a)
        $surface1Alpha = 45475a

        $surface0 = rgb(313244)
        $surface0Alpha = 313244

        $base = rgb(1e1e2e)
        $baseAlpha = 1e1e2e

        $mantle = rgb(181825)
        $mantleAlpha = 181825

        $crust = rgb(11111b)
        $crustAlpha = 11111b

      '';
    };
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
    enable =  true;
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
}
