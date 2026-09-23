{ ... }:
{
  programs.nixvim.plugins = {
    illuminate = {
      enable = true;
      settings = {
        delay = 200;
        large_file_cutoff = 2000;
        providers = [
          "lsp"
          "treesitter"
          "regex"
        ];
      };
    };

  };
}
