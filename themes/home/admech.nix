{pkgs, ...}: {
  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/atelier-dune-light.yaml";
    targets.cava.rainbow.enable = true;
    config.scheme = (config.lib.base16.mkSchemeAttrs "${pkgs.base16-schemes}/share/themes/atelier-dune-light.yaml").override {
      scheme = "Now it's my scheme >:]";
      base00 = "000000"; # make background completely black
    };
  };

  programs = {
    fish.functions = {
      fish_greeting = "pokeget oddish --hide-name | fastfetch --file-raw -";
    };
  };

  home.file = {
    ".config/fastfetch/theme" = {
      executable = true;
      text = ''
        echo "Atelier Dune Light"
      '';
    };
  };
}
