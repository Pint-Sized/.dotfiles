{
  inputs,
  config,
  pkgs,
  pkgs-unstable,
  lib,
  catppuccin,
  nix-flatpak,
  ...
}:

{
  services.flatpak = {
    enable = true;
    packages = [
      "com.github.tchx84.Flatseal"
      "io.gitlab.librewolf-community"
      "com.valvesoftware.Steam"
      "io.gitlab.fattool.Warehouse"
      "com.rtosta.zapzap"
    ];
  };
}
