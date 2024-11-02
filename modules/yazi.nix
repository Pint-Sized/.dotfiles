{
  config,
  pkgs,
  catppuccin,
  lib,
  ...
}:

{
  # ----- YAZI ----- #
  programs.yazi = {
    enable = true;
    settings = {
      manager = {
        show_hidden = true;
        sort_by = "alphabetical";
        linemode = "owner";
        show_symlink = true;
      };
      preview = {
        wrap = "no";
      };
    };
  };
}
