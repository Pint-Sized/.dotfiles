{ ... }:
{
  programs.nixvim.plugins = {
    fidget = {
      enable = true;
      settings = {
        progress = {
          suppress_on_insert = false;
          display.done_icon = "✓";
        };
        notification.window = {
          winblend = 0;
          border = "solid";
        };
      };
    };

  };
}
