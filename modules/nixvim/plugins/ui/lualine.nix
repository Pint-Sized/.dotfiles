{ config, ... }:

{
  programs.nixvim.plugins.lualine = with config.lib.stylix.colors; {
    enable = true;
    settings = {
      options = {
        globalstatus = false;
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
                left = "",
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
            symbols = {
              modified = "";
              readonly = "󰷧";
              unnamed = "[No Name]";
              newfile = "󰎔";
            };
            color = {
              fg = "#${base05-hex}";
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
              bg = "#${base01-hex}";
            };
            padding = {
              left = 1;
              right = 1;
            };
          }
        ];
        lualine_y = [
          {
            __unkeyed-1 = "filetype";
            icon_only = true;
            colored = false;
            separator = {
              left = "";
              right = "";
            };
            color = {
              bg = "#${base00-hex}";
              fg = "#${base00-hex}";
            };
            padding = 0;
          }
        ];
        lualine_z = [
          {
            __unkeyed-1 = "progress";
            separator.left = "";
            color = {
              fg = "#${base01-hex}";
              bg = "#${base08-hex}";
            };
          }
          {
            __unkeyed-1 = "location";
            color = {
              fg = "#${base05-hex}";
              bg = "#${base01-hex}";
            };
            padding = 0;
          }
          {
            __unkeyed-1 = "filetype";
            icon_only = true;
            colored = false;
            separator = {
              left = "";
              right = "";
            };
            color = {
              bg = "#${base00-hex}";
              fg = "#${base00-hex}";
            };
            padding = 0;
          }
        ];
      };
    };
  };
}
