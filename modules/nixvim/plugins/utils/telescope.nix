{
  programs.nixvim.plugins.telescope = {
    enable = true;
    extensions = {
      file-browser.enable = true;
      undo.enable = true;
      media-files.enable = true;
      manix.enable = true;
      ui-select.enable = true;
    };
  };
}
