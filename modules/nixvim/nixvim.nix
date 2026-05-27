{ config, pkgs, ... }:
let
  colors = config.lib.stylix.colors;
in
{
  programs.nixvim = {
    enable = true;
    extraPackages = with pkgs; [
      nixfmt-rfc-style
      black
      stylua
      prettierd
    ];

    autoCmd = [
      {
        event = "FileType";
        pattern = [
          "csv"
          "tsv"
        ];
        callback.__raw = ''
          function()
            require('csvview').enable()
          end
        '';
      }
    ];

    globals.mapleader = " ";

    opts = {
      termguicolors = true;
      number = true;
      relativenumber = true;
      cursorline = true;
      wrap = false;
      scrolloff = 8;
      sidescrolloff = 8;
      cmdheight = 0;

      laststatus = 0;
      showtabline = 0;

      showmode = false;
      ruler = false;

      tabstop = 2;
      shiftwidth = 2;
      softtabstop = 2;
      expandtab = true;
      smartindent = true;
      autoindent = true;
      linebreak = true;
      breakindent = true;

      ignorecase = true;
      smartcase = true;
      hlsearch = true;
      incsearch = true;

      signcolumn = "yes";
      showmatch = true;
      fillchars = {
        eob = " ";
        horiz = " ";
        horizup = " ";
        horizdown = " ";
      };

      backup = false;
      writebackup = false;
      swapfile = false;
      undofile = true;
      updatetime = 250;
      timeoutlen = 500;
      ttimeoutlen = 50;
      autoread = true;
      autowrite = false;

      hidden = true;
      backspace = "indent,eol,start";
      path = "**";
      selection = "inclusive";
      mouse = "a";
      clipboard = "unnamedplus";
      modifiable = true;

      foldmethod = "expr";
      foldexpr = "v:lua.vim.treesitter.foldexpr()";
      foldlevel = 99;

      splitbelow = true;
      splitright = true;
      splitkeep = "screen";
    };
    plugins = {
      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
          ident.enable = true;
          incremental_selection = {
            enable = true;
            keymaps = {
              init_selection = "<C-space>";
              node_incremental = "<C-space>";
              node_decremental = "<bs>";
              scope_incremental = false;
            };
          };
        };
      };
      treesitter-context = {
        enable = true;
        settings = {
          max_lines = 3;
          multiline_threshold = 1;
        };
      };
      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
          bashls.enable = true;
          pyright.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
          clangd.enable = true;
          gopls.enable = true;
          ts_ls.enable = true;
          html.enable = true;
          cssls.enable = true;
          jsonls.enable = true;
          yamlls.enable = true;
          taplo.enable = true;
          lua_ls.enable = true;
          marksman.enable = true;
        };
      };

      luasnip.enable = true;

      cmp = {
        enable = true;
        settings = {
          autoEnableSources = true;
          snippet.expand = "luasnip";
          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
            { name = "luasnip"; }
          ];
          mapping = {
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          };
        };
      };

      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            nix = [ "nixfmt" ];
            python = [ "black" ];
            lua = [ "stylua" ];
            javascript = [ "prettierd" ];
            typescript = [ "prettierd" ];
            javascriptreact = [ "prettierd" ];
            typescriptreact = [ "prettierd" ];
            json = [ "prettierd" ];
            html = [ "prettierd" ];
            css = [ "prettierd" ];
            yaml = [ "prettierd" ];
            markdown = [ "prettierd" ];
          };
          format_on_save = {
            timeout_ms = 500;
            lsp_format = "fallback";
          };
        };
      };

      snacks = {
        enable = true;
        settings = {
          picker.enabled = true;
          explorer.enabled = true;
          bigfile.enabled = true;
        };
      };

      nvim-autopairs.enable = true;
      web-devicons.enable = true;
      gitsigns.enable = true;
      noice.enable = true;
      #notify.enable = true;

      indent-blankline = {
        enable = true;
        settings = {
          indent.char = "│";
          scope = {
            enabled = true;
            show_start = false;
            show_end = false;
          };
        };
      };

      colorizer = {
        enable = true;
        settings = {
          filetypes = [ "*" ];
          userDefaultOptions = {
            names = false;
            css = true;
            RRGGBBAA = true;
            AARRGGBB = true;
            rgb_fn = true;
            hsl_fn = true;
            mode = "background";
          };
        };
      };

      lspkind.enable = true;

      illuminate = {
        enable = true;
        settings = {
          delay = 200;
          large_file_cutoff = 2000;
          providers = [
            "lsp"
            "treesitter"
            "regex"
          ];
        };
      };

      lspsaga = {
        enable = true;
        settings = {
          ui = {
            border = "solid";
            codeAction = "💡";
          };
          symbol_in_winbar = {
            enable = false;
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

      modicator = {
        enable = true;
        settings.show_warnings = false;
      };

      bullets = {
        enable = true;
        settings = {
          enabled_file_types = [
            "markdown"
            "text"
            "gitcommit"
          ];
          set_mappings = true;
          pad_right = false;
        };
      };

      which-key.enable = true;
      rainbow-delimiters.enable = true;

      todo-comments = {
        enable = true;
        settings = {
          signs = true;
          highlight = {
            keyword = "bg";
            after = "fg";
          };
        };
      };

      markdown-preview = {
        enable = true;
        settings = {
          auto_start = 0;
          auto_close = 1;
        };
      };

      render-markdown = {
        enable = true;
        settings = {
          heading = {
            width = "block";
            position = "inline";
          };
          bullet.icons = [
            "•"
            "○"
            "◆"
            "◇"
          ];
          anti_conceal.enabled = true;
        };
      };

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

      csvview = {
        enable = true;
        settings = {
          view = {
            min_column_width = 5;
            spacing = 2;
          };
          parser.comments = [
            "#"
            "//"
          ];
        };
      };

      tiny-glimmer = {
        enable = true;
        settings = {
          default_animation = "fade";
          overwrite = {
            auto_map = true;
            yank.enabled = true;
            paste.enabled = true;
            undo.enabled = true;
            search.enabled = true;
          };
        };
      };

      aerial = {
        enable = true;
        settings = {
          backends = [
            "lsp"
            "treesitter"
            "markdown"
            "man"
          ];
          filter_kind = false;
          layout = {
            default_direction = "right";
            max_width = 30;
            min_width = 30;
          };
          show_guides = false;
          icons = {
            Array = "󰅪 ";
            Boolean = "◩ ";
            Class = "󰠱 ";
            Constant = "󰏿 ";
            Constructor = " ";
            Enum = " ";
            EnumMember = " ";
            Event = " ";
            Field = "󰜢 ";
            File = "󰈙 ";
            Function = "󰊕 ";
            Interface = " ";
            Key = "󰌋 ";
            Method = "󰆧 ";
            Module = "󰏗 ";
            Namespace = "󰌗 ";
            Null = "󰟢 ";
            Number = "󰎠 ";
            Object = "󰅩 ";
            Operator = "󰆕 ";
            Package = "󰏖 ";
            Property = "󰜢 ";
            Reference = "󰈇 ";
            String = "󰀬 ";
            Struct = "󰙅 ";
            TypeParameter = "󰊄 ";
            Variable = "󰀫 ";
          };
        };
      };

      lualine = {
        enable = true;
        settings = {
          options = {
            globalstatus = false;
            ignore_focus = [
              "aerial"
              "snacks_picker_list"
              "snacks_picker_input"
              "neo-tree"
            ];
            extensions = [
              "fzf"
              "neo-tree"
            ];
            disabled_filetypes = {
              statusline = [
                "startup"
                "alpha"
              ];
              winbar = [
                "startup"
                "alpha"
              ];
            };
            theme.__raw = ''
              (function()
                local theme = require('lualine.themes.base16')
                theme.normal.c.bg = '#${colors.base00-hex}'
                return theme
              end)()
            '';
          };

          winbar = {
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
            lualine_c = [ "" ];
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
                __unkeyed-1.__raw = ''
                  function()
                    local msg = 'No Active Lsp'
                    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                    local clients = vim.lsp.get_clients({ bufnr = 0 })
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

          inactive_winbar = {
            lualine_a = [ "" ];
            lualine_b = [ "" ];
            lualine_c = [ "" ];
            lualine_x = [ "" ];
            lualine_y = [ "" ];
            lualine_z = [ "" ];
          };
          sections = {
            lualine_a = [ "" ];
            lualine_b = [ "" ];
            lualine_c = [ "" ];
            lualine_x = [ "" ];
            lualine_y = [ "" ];
            lualine_z = [ "" ];
          };
          inactive_sections = {
            lualine_a = [ "" ];
            lualine_b = [ "" ];
            lualine_c = [ "" ];
            lualine_x = [ "" ];
            lualine_y = [ "" ];
            lualine_z = [ "" ];
          };
          tabline = { };
        };
      };
    };

    highlight = {
      NormalMode = {
        fg = "#${colors.base0D}";
        bold = true;
      };
      InsertMode = {
        fg = "#${colors.base0B}";
        bold = true;
      };
      VisualMode = {
        fg = "#${colors.base0E}";
        bold = true;
      };
      CommandMode = {
        fg = "#${colors.base09}";
        bold = true;
      };
      ReplaceMode = {
        fg = "#${colors.base08}";
        bold = true;
      };
      SelectMode = {
        fg = "#${colors.base0E}";
        bold = true;
      };
      TerminalMode = {
        fg = "#${colors.base09}";
        bold = true;
      };
      TerminalNormalMode = {
        fg = "#${colors.base0D}";
        bold = true;
      };
      IlluminatedWordText = {
        bg = "#${colors.base02}";
      };
      IlluminatedWordRead = {
        bg = "#${colors.base02}";
      };
      IlluminatedWordWrite = {
        bg = "#${colors.base02}";
      };
      "@property" = {
        fg = "#${colors.base0D}";
      };
      "@variable.builtin" = {
        fg = "#${colors.base09}";
      };
      "@function.builtin" = {
        fg = "#${colors.base0C}";
      };
      "@variable.parameter" = {
        fg = "#${colors.base08}";
      };
      "@keyword" = {
        fg = "#${colors.base0E}";
      };
      "@string" = {
        fg = "#${colors.base0B}";
      };
      "@string.special.path" = {
        fg = "#${colors.base0B}";
      };
      "@comment" = {
        fg = "#${colors.base03}";
        italic = true;
      };
      "@lsp.type.property" = {
        fg = "#${colors.base0D}";
      };
      "@lsp.type.variable" = {
        fg = "#${colors.base09}";
      };
      "@lsp.type.function" = {
        fg = "#${colors.base0C}";
      };
      "@lsp.type.parameter" = {
        fg = "#${colors.base08}";
      };
      StatusLine = {
        bg = "#${colors.base00}";
        fg = "#${colors.base00}";
      };
      StatusLineNC = {
        bg = "#${colors.base00}";
        fg = "#${colors.base00}";
      };
      WinSeparator = {
        bg = "none";
        fg = "#${colors.base03}";
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>o";
        action = "<cmd>AerialToggle!<CR>";
        options = {
          desc = "Toggle Right Outline (Aerial)";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>fs";
        action.__raw = "function() Snacks.picker.lsp_symbols() end";
        options = {
          desc = "Find Symbols (Snacks)";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>ff";
        action.__raw = "function() Snacks.picker.files() end";
        options = {
          desc = "Find Files (Snacks)";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>fg";
        action.__raw = "function() Snacks.picker.grep() end";
        options = {
          desc = "Live Grep (Snacks)";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>fb";
        action.__raw = "function() Snacks.picker.buffers() end";
        options = {
          desc = "Buffers (Snacks)";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-n>";
        action.__raw = "function() Snacks.explorer() end";
        options = {
          desc = "Toggle Explorer (Snacks)";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>fe";
        action.__raw = "function() Snacks.explorer() end";
        options = {
          desc = "Focus Explorer (Snacks)";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>ft";
        action.__raw = "function() Snacks.picker.todo_comments() end";
        options = {
          desc = "Find TODOs (Snacks)";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "]t";
        action.__raw = "function() require('todo-comments').jump_next() end";
        options = {
          desc = "Next TODO comment";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "[t";
        action.__raw = "function() require('todo-comments').jump_prev() end";
        options = {
          desc = "Previous TODO comment";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "K";
        action = "<cmd>Lspsaga hover_doc<CR>";
        options = {
          desc = "Hover Documentation";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "gd";
        action = "<cmd>Lspsaga goto_definition<CR>";
        options = {
          desc = "Goto Definition";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "gh";
        action = "<cmd>Lspsaga finder<CR>";
        options = {
          desc = "LSP Finder (References & Implementation)";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>ca";
        action = "<cmd>Lspsaga code_action<CR>";
        options = {
          desc = "Code Action";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>rn";
        action = "<cmd>Lspsaga rename<CR>";
        options = {
          desc = "Rename Variable";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Lspsaga show_line_diagnostics<CR>";
        options = {
          desc = "Show Line Diagnostics";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "[d";
        action = "<cmd>Lspsaga diagnostic_jump_prev<CR>";
        options = {
          desc = "Previous Diagnostic";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "]d";
        action = "<cmd>Lspsaga diagnostic_jump_next<CR>";
        options = {
          desc = "Next Diagnostic";
          silent = true;
        };
      }
    ];
  };
}
