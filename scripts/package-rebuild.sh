#!/run/current-system/sw/bin/bash
sudo clear
nvim ~/.dotfiles/system/packages.nix
sudo nixos-rebuild switch --flake ~/.dotfiles
