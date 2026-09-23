{ ... }:
{
  programs.nixvim.plugins = {
    tiny-glimmer = {
      enable = true;
      settings = {
        default_animation = "fade";
        overwrite = {
          auto_map = true;
          yank.enabled = true;
          paste.enabled = true;
          undo.enabled = true;
          search.enabled = true;
        };
      };
    };

  };
}
