{
  programs.nixvim.plugins.lualine = {
    enable = true;
    settings = {
      options = {
        globalstatus = true;
        extensions = [
          "fzf"
          "neo-tree"
        ];
        disabledFiletypes = {
          statusline = [
            "startup"
            "alpha"
          ];
        };
      };
      tabline = {
        lualine_a = [
          {
            __unkeyed-1 = "mode";
            separator = {
              left = " ";
              right = "";
            };
          }
        ];
        lualine_b = [ { } ];
        lualine_c = [
          {
            __unkeyed-1 = "filename";
            path = 1;
            separator = {
            };
          }
        ];
        lualine_x = [ { } ];
        lualine_y = [
          {
            __unkeyed-1 = "progress";
            separator.left = " ";
          }
        ];
        lualine_z = [
          {
            __unkeyed-1 = "location";
            separator = {
              left = " ";
              right = "";
            };
          }
        ];
      };
    };
  };
}
