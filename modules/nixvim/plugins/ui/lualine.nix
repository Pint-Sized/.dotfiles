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
      sections = {
        lualine_a = [
          {
            __unkeyed-1 = "mode";
            icon = "";
            separator = {
              left = " ";
              right = "";
            };
          }
        ];
        lualine_b = [
          {
            __unkeyed-1 = "filetype";
            icon_only = true;
            separator = "";
            padding = {
              left = 1;
              right = 0;
            };
          }
          {
            __unkeyed-1 = "filename";
            path = 1;
          }
        ];
        lualine_x = [
          {
            __unkeyed-1 = "branch";
            icon = "";
          }
          {
            __unkeyed-1 = "diff";
            symbols = {
              added = " ";
              modified = " ";
              removed = " ";
            };
          }
        ];
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
