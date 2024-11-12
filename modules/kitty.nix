{
  config,
  pkgs,
  catppuccin,
  lib,
  ...
}:

{
  # ------- KITTY ------- #
  programs.kitty = {
    enable = true;
    font = {
      size = 11;
      name = "0x Proto Nerd Font";
    };
    shellIntegration.enableFishIntegration = true;
    settings = {
      confirm_os_window_close = 0;
      tab_bar_min_tabs = 1;
      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      tab_title_template = "{title}{' :{}:'.format(num_windows) if num_windows > 1 else ''}";
    };
  };
}
