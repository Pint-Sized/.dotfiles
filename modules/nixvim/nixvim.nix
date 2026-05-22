{ config, pkgs, ... }:
let
  colors = config.lib.stylix.colors;
in
{
  imports = [ ./lualine.nix ];
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
        settings.highlight.enable = true;
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
        };
      };

      nvim-autopairs.enable = true;
      web-devicons.enable = true;
      gitsigns.enable = true;
      noice.enable = true;
      notify.enable = true;

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
          symbolInWinbar.enable = false;
          lightbulb.enable = false;
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

      navic = {
        enable = true;
        settings = {
          lsp = {
            auto_attach = true;
          };
          highlight = true;
          separator = "  ";
          depth_limit = 0;
          depth_limit_indicator = "..";
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

          # Show everything (Nix variables and properties)
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
      # FIX 3: Added Snacks LSP Symbols picker
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
