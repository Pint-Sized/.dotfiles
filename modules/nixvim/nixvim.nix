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
    globals.mapleader = " ";
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      smartindent = true;
      clipboard = "unnamedplus";
      termguicolors = true;
      ignorecase = true;
      smartcase = true;
      updatetime = 250;
      cursorline = true;
      undofile = true;
      signcolumn = "yes";
      splitbelow = true;
      splitright = true;
      splitkeep = "screen";
      linebreak = true;
      breakindent = true;
      scrolloff = 8;
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
      cmp = {
        enable = true;
        settings = {
          autoEnableSources = true;
          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
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
