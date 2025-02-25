{ pkgs, ... }:

{
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/grayscale-dark.yaml";

  programs = {
    nixvim.colorschemes.base16 = {
      enable = true;
      colorscheme = "grayscale-dark";
    };
    fish.functions = {
      fish_greeting = "pokeget oddish --hide-name | fastfetch --file-raw -";
    };
  };

  home.file = {
    ".config/fastfetch/theme" = {
      executable = true;
      text = ''
        echo "Grayscale Dark"
      '';
    };
  };
}
