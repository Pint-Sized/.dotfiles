{ ... }:
{
  programs.nixvim.plugins = {
    todo-comments = {
      enable = true;
      settings = {
        signs = true;
        highlight = {
          keyword = "bg";
          after = "fg";
        };
      };
    };

  };
}
