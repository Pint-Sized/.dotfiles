{ pkgs, ... }:

{
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/horizon-terminal-dark.yaml";
    cursor.size = 16;
  };
}
