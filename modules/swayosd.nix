{ config, ... }:

{
  services.swayosd = {
    enable = true;
  };
  home.file.".config/swayosd/style.css".text = with config.lib.stylix.colors; ''
    window#osd {
        padding: 12px 20px;
        border-radius: 999px;
        border: none;
        background: #{"${base00-hex}"};

      #container {
        margin: 16px;
      }

      image,
      label {
        color: #{"${base05-hex}"};
      }

      progressbar:disabled,
      image:disabled {
        opacity: 0.5;
      }

      progressbar {
        min-height: 6px;
        border-radius: 999px;
        background: transparent;
        border: none;
      }
      trough {
        min-height: inherit;
        border-radius: inherit;
        border: none;
        background: #{"${base00-hex}};
      }
      progress {
        min-height: inherit;
        border-radius: inherit;
        border: none;
        background: #{"${base05-hex}"};
        }
    }
  '';
}
