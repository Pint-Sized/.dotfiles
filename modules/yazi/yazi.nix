{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      manager = {
        show_hidden = true;
        sort_by = "natural";
        sort_dir_first = true;
        sort_sensitive = false;
        sort_translit = true;
        show_symlink = true;
      };
      preview = {
        wrap = "yes";
        imgage_filter = "catmull-rom";
        image_quality = 90;
      };
    };
  };
  xdg.configFile."yazi/yazi.toml".source = ./yazi.toml;
}
