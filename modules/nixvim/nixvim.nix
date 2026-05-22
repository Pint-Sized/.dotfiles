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
    globals.mapleader = " ";
    opts = {
      termguicolors = true;
      number = true;
      relativenumber = true;
      cursorline = true;
      wrap = false;
      scrolloff = 8;
      sidescrolloff = 8;

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
        keymaps = {
          diagnostic = {
            "[d" = "goto_prev";
            "]d" = "goto_next";
          };
          lspBuf = {
            "gd" = "definition";
            "gD" = "references";
            "K" = "hover";
            "<leader>rn" = "rename";
            "<leader>ca" = "code_action";
          };
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
      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = "find_files";
          "<leader>fg" = "live_grep";
          "<leader>fb" = "buffers";
        };
      };
      nvim-autopairs.enable = true;
      web-devicons.enable = true;
      gitsigns.enable = true;
      lualine.enable = true;
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
    };
    highlight = {
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
  };
}
