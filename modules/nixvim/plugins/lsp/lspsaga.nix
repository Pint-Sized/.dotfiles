{ ... }:
{
  programs.nixvim.plugins = {
    lspsaga = {
      enable = true;
      settings = {
        ui = {
          border = "solid";
          codeAction = "💡";
        };
        symbol_in_winbar = {
          enable = true;
        };
        lightbulb = {
          enable = false;
        };
        rename = {
          autoSave = true;
          keys = {
            quit = "<C-c>";
            exec = "<CR>";
          };
        };
      };
    };

  };
}
