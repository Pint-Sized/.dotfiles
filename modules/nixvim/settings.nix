{ config, pkgs, ... }:
let
  colors = config.lib.stylix.colors;
in
{
  programs.nixvim = {
    extraPackages = with pkgs; [
      nixfmt
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
