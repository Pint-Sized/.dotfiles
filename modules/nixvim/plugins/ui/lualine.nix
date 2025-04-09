{
  programs.nixvim.plugins.lualine = {
    enable = true;
    mode_map = {
      n = "N";
      no = "O·P";
      nov = "O·P";
      noV = "O·P";
      niI = "N·I";
      niR = "N·R";
      niV = "N";
      nt = "N·T";
      v = "V";
      vs = "V";
      V = "V·L";
      Vs = "V·L";
      s = "S";
      S = "S·L";
      i = "I";
      ic = "I·C";
      ix = "I·X";
      R = "R";
      Rc = "R·C";
      Rx = "R·X";
      Rv = "V·R";
      Rvc = "RVC";
      Rvx = "RVX";
      c = "C";
      cv = "EX";
      ce = "EX";
      r = "R";
      rm = "M";
      t = "T";
    };
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
            __unkeyed-1.__raw = ''
              "mode",
              icons_enabled = true,
              separator = {
                left = " ",
                right = "",
              },
              fmt = function()
                return mode_map[vim.api.nvim_get_mode().mode] or vim.api.nvim_get_mode().mode
              end
            '';
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
