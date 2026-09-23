{
  programs.nixvim.plugins.copilot-lua = {
    enable = true;
    settings = {
      suggestion = {
        enabled = true;
        auto_trigger = true;
        hide_during_completion = true;
      };
      panel.enabled = false;
    };
  };
}
