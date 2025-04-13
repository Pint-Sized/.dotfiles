{ pkgs, inputs, ... }:
let
  hyprland-pkgs = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  hardware = {
    graphics = {
      enable = true;
      package = hyprland-pkgs.mesa;
      enable32Bit = true;
      package32 = hyprland-pkgs.pkgsi686Linux.mesa;
    };
  };
}
