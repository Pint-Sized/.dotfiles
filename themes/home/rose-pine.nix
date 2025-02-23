{ pkgs, ... }:

{
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";

  programs = {
    nixvim.colorschemes.base16 = {
      enable = true;
      colorscheme = "rose-pine";
    };
    fish.functions = {
      fish_greeting = "pokeget purrloin --hide-name | fastfetch --file-raw -";
    };
  };

  home.file = {
    ".config/fastfetch/theme" = {
      executable = true;
      text = ''
        echo "Rosé Pine"
      '';
    };
  };
}
