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
      name = "0xProto Nerd Font";
    };
    shellIntegration.enableFishIntegration = true;
    settings = {
      confirm_os_window_close = 0;
      cursor_trail = 3;
    };
  };
}
