{
  catppuccin,
  lib,
  config,
  pkgs,
  pkgs-unstable,
  nixvim,
  stylix,
  ...
}:

{
  imports = [
    #./themes/3024.nix # dusky oranges
    #./themes/black-metal-venom.nix # blacked out
    #./themes/catppuccin-mocha-mauve.nix # the goat
    #./themes/dracula.nix # classic
    #./themes/eighties.nix # classy greys
     ./themes/google-dark.nix
    #./themes/google-light.nix # light mode with accents
    #./themes/greenscreen.nix
    #./themes/gruvbox-material-dark-soft.nix
    #./themes/horizon-terminal-dark.nix
    #./themes/nord.nix
    #./themes/pasque.nix
    #./themes/pinky.nix
    #./themes/phd.nix
    #./themes/rose-pine.nix
    #./themes/snazzy.nix
    #./themes/spaceduck.nix
    #./themes/tokyo-night-moon.nix
    #./themes/uwunicorn.nix
    #./themes/xcode-dusk.nix
  ];
}
