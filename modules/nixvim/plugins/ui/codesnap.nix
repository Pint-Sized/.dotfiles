{ config, ... }:

{
  programs.nixvim.plugins.codesnap = with config.lib.stylix.colors; {
    enable = true;
    settings = {
      bg_color = "#${base00-hex}";
      code_font_family = "${userSettings.fontSerif}";
      breadcrumbs_separator = "/";
      has_breadcrumbs = false;
      has_line_number = false;
      mac_window_bar = true;
      save_path = "~/Images/Code-Snippets";
      title = "CodeSnap.nvim";
      watermark = "";
    };
  };
}
