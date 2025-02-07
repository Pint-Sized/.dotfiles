#1 /run/current-system/sw/bin/bash
sudo nix-channel --add https://github.com/NixOS/nixos-hardware/archive/master.tar.gz nixos-hardware
sudo nix-channel --update
mkdir ~/.config/wlogout/images
cp ~/.dotfiles/icons/wlogout/* ~/.config/wlogout/images/
mkdir ~/.local/share/fonts
cp -r ./fonts/* ~/.local/share/fonts/
