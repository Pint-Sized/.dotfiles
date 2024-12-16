{ inputs, config, pkgs, pkgs-unstalbe, lib, nix-flatpak, stylix, ... }: {
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
    cursor.size = 16;
  };
}
