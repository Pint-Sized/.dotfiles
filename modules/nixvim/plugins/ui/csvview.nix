{ ... }:
{
  programs.nixvim.plugins = {
    csvview = {
      enable = true;
      settings = {
        view = {
          min_column_width = 5;
          spacing = 2;
        };
        parser.comments = [
          "#"
          "//"
        ];
      };
    };

  };
}
