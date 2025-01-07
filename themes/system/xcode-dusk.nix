{ pkgs, ... }:

{
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/xcode-dusk.yaml";
    cursor.size = 16;
  };
}
