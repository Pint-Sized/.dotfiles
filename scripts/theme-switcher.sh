#!/run/current-system/sw/bin/bash
sudo clear
nvim ~/.dotfiles/themes/home-theme-selector.nix
nvim ~/.dotfiles/themes/system-theme-selector.nix
sudo nixos-rebuild switch --flake ~/.dotfiles
home-manager switch --flake ~/.dotfiles
~/.dotfiles/scripts/reloader
