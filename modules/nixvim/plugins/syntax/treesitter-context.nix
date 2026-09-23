{ ... }:
{
  programs.nixvim.plugins = {
    treesitter-context = {
      enable = true;
      settings = {
        max_lines = 3;
        multiline_threshold = 1;
      };
    };
  };
}
