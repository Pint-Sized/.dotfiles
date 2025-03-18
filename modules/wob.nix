{ config, ... }:

{
  services.wob = {
    enable = true;
    settings = with config.lib.stylix.colors; {
      "" = {
        timeout = 1000;
        width = 400;
        height = 50;
        border_offset = 4;
        border_size = 4;
        bar_padding = 4;
        border_color = "${base05-hex}";
        background_color = "${base00-hex}";
        bar_color = "${base0A-hex}";
        overflow_bar_color = "${base08-hex}";
        overflow_background_color = "${base00-hex}";
        overflow_border_color = "${base05-hex}";
      };
    };
  };
}
