{ pkgs, ... }:

{
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/black-metal-venom.yaml";
    cursor.size = 16;
  };
}
