{ ... }:
{
  programs.nixvim.plugins = {
    colorizer = {
      enable = true;
      settings = {
        filetypes = [ "*" ];
        userDefaultOptions = {
          names = false;
          css = true;
          RRGGBBAA = true;
          AARRGGBB = true;
          rgb_fn = true;
          hsl_fn = true;
          mode = "background";
        };
      };
    };

  };
}
