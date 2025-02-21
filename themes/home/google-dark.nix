{ pkgs, ... }:

{
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/google-dark.yaml";

  programs = {
    nixvim.colorschemes.base16 = {
      enable = true;
      colorscheme = "google-dark";
    };
    fish.functions = {
      fish_greeting = "pokeget pichu --hide-name | fastfetch --file-raw -";
    };
    wlogout.style = ''
      @import "icons.css";
      window {
          font-family: "0xProto Nerd Font";
          font-size: 14pt;
          color: #c5c8c6; /* text */
          background-color: rgba(40, 42, 46, 0.5);
      }

      button {
          background-repeat: no-repeat;
          background-position: center;
          background-size: 25%;
          border: none;
          background-color: rgba(40, 42, 46, 0);
          margin: 5px;
          transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
      }

      button:hover {
          background-color: rgba(40, 42, 46, 0.1);
      }

      button:focus {
          background-color: #A36AC7;
          color: #1d1f21;
      }
    '';
  };
  home.file = {
    ".config/fastfetch/theme" = {
      executable = true;
      text = ''
        echo "Google Dark"
      '';
    };
    ".config/hypr/theme.conf" = {
      enable = true;
      text = ''
        $base00 = rgb(1d1f21)
        $base01 = rgb(282a2e)
        $base02 = rgb(373b41)
        $base03 = rgb(969896)
        $base04 = rgb(b4b7b4)
        $base05 = rgb(c5c8c6)
        $base06 = rgb(e0e0e0)
        $base07 = rgb(ffffff)
        $base08 = rgb(CC342B)
        $base09 = rgb(F96A38)
        $base0A = rgb(FBA922)
        $base0B = rgb(198844)
        $base0C = rgb(3971ED)
        $base0D = rgb(A36AC7)
        $base0E = rgb(3971ED)
        $base0F = rbg(3971ED)
      '';
    };
    ".config/waybar/theme.css" = {
      enable = true;
      text = ''
        @define-color base00 #1d1f21;
        @define-color base01 #282a2e;
        @define-color base02 #373b41;
        @define-color base03 #969896;
        @define-color base04 #b4b7b4;
        @define-color base05 #c5c8c6; 
        @define-color base06 #e0e0e0;
        @define-color base07 #ffffff;
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
    ".config/ulauncher/user-themes/theme/colours.css" = {
      text = ''
        @define-color background #282a2e;
        @define-color current_line_background #1d1f21;
        @define-color foreground #b4b7b4;
        @define-color foreground_lessimportant #c5c8c6;
        @define-color accent #F96A38;
        @define-color highlight #F96A38;
      '';
    };
    ".config/ulauncher/user-themes/theme/manifest.json" = {
      text = ''
              {
          "manifest_version": "1",
          "name": "stylix-theme",
          "display_name": "Stylix Theme",
          "extend_theme": "dark",
          "css_file": "theme.css",
          "css_file_gtk_3.20+": "theme-gtk-3.20.css",
          "matched_text_hl_colors": {
            "when_selected": "#A36AC7",
            "when_not_selected": "#A36AC7"
          }
        }
      '';
    };
  };
}
