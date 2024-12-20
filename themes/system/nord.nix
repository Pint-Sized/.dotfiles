{
  inputs,
  config,
  pkgs,
  pkgs-unstalbe,
  lib,
  nix-flatpak,
  stylix,
  ...
}:
{
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
    cursor.size = 16;
  };
}
