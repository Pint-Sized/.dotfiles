{ stylix, config, pkgs, pkgs-unstable, lib, ... }:

{
  stylix = {
    enable = true;
    image = ~/Wallpapers/evening-sky.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml"
  };
}
