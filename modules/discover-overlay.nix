{ config, ... }:

{
  home.file.".config/discover_overlay/colours.py".text = with config.lib.stylix.colors; ''
    tk_col-r = ${base0E-rgb-r}/255
    tk_col-g = ${base0E-rgb-g}/255
    tk_col-b = ${base0E-rgb-b}/255

    fg_hi_col-r = ${base05-rgb-r}/255
    fg_hi_col-g = ${base05-rgb-g}/255
    fg_hi_col-b = ${base05-rgb-b}/255


    fg_col-r = ${base05-rgb-r}/255
    fg_col-g = ${base05-rgb-g}/255
    fg_col-b = ${base05-rgb-b}/255


    mt_col-r = ${base05-rgb-r}/255
    mt_col-g = ${base05-rgb-g}/255
    mt_col-b = ${base05-rgb-b}/255
  '';
}
