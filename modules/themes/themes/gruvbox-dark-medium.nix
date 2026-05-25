{ pkgs, ... }:
{
  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    targets.cava.rainbow.enable = true;
  };
  programs = {
    fish.functions = {
      fish_greeting = "pokeget roselia --hide-name | fastfetch --file-raw -";
    };
  };
  home.file = {
    ".config/fastfetch/theme" = {
      executable = true;
      text = ''
        echo "Gruvbox"
      '';
    };
  };
}
