{ config, ... }:
let
  colors = config.lib.stylix.colors;
in
{
  programs.nixvim = {
    plugins.lualine = {
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
              __unkeyed-1 = "filetype";
              icon_only = true;
              colored = false;
              color = {
                fg = "#${colors.base00-hex}";
                bg = "#${colors.base00-hex}";
              };
              padding = 0;
              separator = {
                left = "";
                right = "";
              };
            }
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
              __unkeyed-1.__raw = ''
                'filename',
                separator = {
                  left = "",
                },
                symbols = {
                  modified = "",
                  readonly = "󰷧",
                  unnamed = "[No Name]",
                  newfile = "󰎔",
                },
                color = {
                  fg = "#${colors.base05-hex}",
                  bg = "#${colors.base00-hex}",
                  gui = "bold",
                },
              '';
            }
          ];
          lualine_c = [ { } ];
          lualine_x = [
            {
              __unkeyed-1 = "filetype";
              separator.left = "";
              colored = false;
              icon.align = "left";
              color = {
                fg = "#${colors.base01-hex}";
                bg = "#${colors.base0F-hex}";
              };
            }
            {
              __unkeyed-1 = "lsp_status";
              ignore_lsp = [ "null-ls" ];
              icon = "";
              color = {
                fg = "#${colors.base05-hex}";
                bg = "#${colors.base01-hex}";
              };
              padding = 1;
            }
          ];
          lualine_y = [
            {
              __unkeyed-1 = "filetype";
              icon_only = true;
              colored = false;
              color = {
                fg = "#${colors.base00-hex}";
                bg = "#${colors.base00-hex}";
              };
              padding = 0;
              separator = {
                left = "";
                right = "";
              };
            }
          ];
          lualine_z = [
            {
              __unkeyed-1 = "progress";
              separator.left = "";
              color = {
                fg = "#${colors.base01-hex}";
                bg = "#${colors.base08-hex}";
              };
            }
            {
              __unkeyed-1 = "location";
              color = {
                fg = "#${colors.base05-hex}";
                bg = "#${colors.base01-hex}";
              };
              padding = 1;
            }
            {
              __unkeyed-1 = "filetype";
              icon_only = true;
              colored = false;
              color = {
                fg = "#${colors.base00-hex}";
                bg = "#${colors.base00-hex}";
              };
              padding = 0;
              separator = {
                left = "";
                right = "";
              };
            }
          ];
        };
      };
    };
    extraConfigLua = ''
      local custom_base16 = require'lualine.themes.base16'
      custom_base16.normal.c.bg = '#${colors.base00-hex}'
      require('lualine').setup {
        options = { theme = custom_base16 },
        ...
      }
    '';
  };
}
