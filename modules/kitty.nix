{ userSettings, ... }:
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    settings = {
      confirm_os_window_close = 0;
      cursor_stop_blinking_after = 0;
      cursor_trail = 1;
      cursor_trail_decay = "0.05 0.6";
      cursor_trail_start_threshold = 1;
      italic_font = "${userSettings.fontItalic}";
      bold_italic_font = "${userSettings.fontItalic}";
    };
  };
}
