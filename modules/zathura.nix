{ config, userSettings, ... }:
let
  colors = config.lib.stylix.colors;
in
{
  programs.zathura = {
    enable = true;
    options = {
      guioptions = "none";
      font = "${userSettings.fontSerif}";
      default-bg = "#${colors.base00-hex}";
      default-fg = "#${colors.base01-hex}";
      statusbar-fg = "#${colors.base04-hex}";
      statusbar-bg = "#${colors.base02-hex}";
      inputbar-bg = "#${colors.base00-hex}";
      inputbar-fg = "#${colors.base07-hex}";
      notification-bg = "#${colors.base00-hex}";
      notification-fg = "#${colors.base07-hex}";
      notification-error-bg = "#${colors.base00-hex}";
      notification-error-fg = "#${colors.base07-hex}";
      notification-warning-bg = "#${colors.base00-hex}";
      notification-warning-fg = "#${colors.base08-hex}";
      highlight-color = "rgba(${colors.base0A-rgb-r}, ${colors.base0A-rgb-g}, ${colors.base0A-rgb-b}, 0.5)";
      highlight-active-color = "rgba(${colors.base0D-rgb-r}, ${colors.base0D-rgb-g}, ${colors.base0D-rgb-b}, 0.5)";
      completion-bg = "#${colors.base01-hex}";
      completion-fg = "#${colors.base0D-hex}";
      completion-highlight-fg = "#${colors.base07-hex}";
      completion-highlight-bg = "#${colors.base0D-hex}";
      recolor = true;
      recolor-lightcolor = "#${colors.base01-hex}";
      recolor-darkcolor = "#${colors.base06-hex}";
    };
  };
}
