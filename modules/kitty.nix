{ userSettings, ... }:
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    settings = {
      confirm_os_window_close = 0;
      cursor_trail = 3;
      italic_font = "${userSettings.fontItalic}";
      bold_italic_font = "${userSettings.fontItalic}";
    };
  };
}
