{ config, ... }:

{
  programs.nixvim.plugins.lualine = with config.lib.stylix.colors; {
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
            __unkeyed-1.__raw = ''
              'mode',
              separator = {
                left = " ",
              },
              fmt = function(str) 
                return str:sub(1,1) 
              end
            '';
          }
        ];
        lualine_b = [
          {
            __unkeyed-1 = "filename";
            color = {
              fg = "#${base05-hex}";
              bg = "";
            };
          }
        ];
        lualine_c = [ { } ];
        lualine_x = [
          {
            __unkeyed-1 = "filetype";
            separator.left = "";
            colored = false;
            icon = {
              align = "left";
            };
            color = {
              fg = "#${base01-hex}";
              bg = "#${base0F-hex}";
            };
          }
          {
            __unkeyed-1 = "lsp_status";
            ignore_lsp = [ "null-ls" ];
            icon = "";
            color = {
              fg = "#${base05-hex}";
              bg = "#${base02-hex}";
            };
          }
        ];
        lualine_y = [ { } ];
        lualine_z = [
          {
            __unkeyed-1 = "progress";
            separator.left = "  ";
            color = {
              fg = "#${base01-hex}";
              bg = "#${base08-hex}";
            };
          }
          {
            __unkeyed-1 = "location";
            separator.right = " ";
            color = {
              fg = "#${base05-hex}";
              bg = "#${base02-hex}";
            };
          }
        ];
      };
    };
  };
}
