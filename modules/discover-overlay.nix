{ config, ... }:

{
  home.file.".config/discover_overlay/colours.py".text = with config.lib.stylix.colors; ''
    tk_col-r = ${base0E-rgb-r}
  '';
}
