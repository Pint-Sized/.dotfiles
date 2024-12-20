{
  inputs,
  config,
  pkgs,
  pkgs-unstable,
  lib,
  nix-flatpak,
  stylix,
  ...
}:
{
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    cursor.size = 16;
  };
}
