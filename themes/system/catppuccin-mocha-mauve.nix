{ inputs, config, pkgs, pkgs-unstable, lib, catppuccin, nix-flatpak, stylix, ... }:

{
  catppuccin = {
    enable = true;
    accent = "mauve";
    flavor = "mocha";
  };
  displayManager.sddm.catppuccin = {
    enable = true;
    background = "~/.dotfiles/wallpapers/gruvbox/village.jpg";
    flavor = "mocha";
    font = "0xProto Nerd Font";
    fontSize = "9";
  };
  boot.plymouth.catppuccin = {
    enable = true;
    flavor = "mocha";
  };
    
  boot.loader.grub.catppuccin = {
    enable = true;
    flavor = "mocha";
  };

  console.catppuccin = {
    enable = true;
    flavor = "mocha";
  };

  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    targets = {
      console.enable = false;
      plymouth.enable = false;
      grub.enable = false;
    };
  };
}
