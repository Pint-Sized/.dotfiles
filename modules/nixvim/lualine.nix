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
          disabled_filetypes = {
            statusline = [
              "startup"
              "alpha"
            ];
          };

          # THE FIX: Safely patch the base16 theme inline without double-calling setup()
          theme.__raw = ''
            (function()
              local theme = require('lualine.themes.base16')
              -- Make the middle section blend into the Neovim background
              theme.normal.c.bg = '#${colors.base00-hex}'
              return theme
            end)()
          '';
        };

        # Change this to `tabline` if you actually wanted this at the top of the screen
        sections = {
          lualine_a = [
            # Your left spacer hack
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
            # Custom Mode text (1st letter only)
            {
              __unkeyed-1.__raw = ''
                'mode',
                separator = { left = "" },
                fmt = function(str) return str:sub(1,1) end
              '';
            }
          ];

          lualine_b = [
            {
              __unkeyed-1.__raw = ''
                'filename',
                separator = { left = "" },
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
                }
              '';
            }
          ];

          lualine_c = [ "" ]; # Keep middle completely empty for the transparent effect

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
            # THE FIX: Custom function to actually display attached LSPs
            {
              __unkeyed-1.__raw = ''
                function()
                  local msg = 'No Active Lsp'
                  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                  local clients = vim.lsp.get_active_clients()
                  if next(clients) == nil then return msg end
                  for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                      return client.name
                    end
                  end
                  return msg
                end
              '';
              icon = "";
              color = {
                fg = "#${colors.base05-hex}";
                bg = "#${colors.base01-hex}";
              };
              padding = 1;
            }
          ];

          lualine_y = [
            # Your middle spacer hack
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
            # Your right spacer hack
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
  };
}
