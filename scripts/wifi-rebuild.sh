#!/run/current-system/sw/bin/bash
sudo clear
nvim ~/.dotfiles/system/networking.nix
sudo nixos-rebuild switch --flake ~/.dotfiles
