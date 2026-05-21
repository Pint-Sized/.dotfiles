{ config, ... }:
let
  colors = config.lib.stylix.colors;
in
{
  imports = [ ./extraFiles.nix ];
  programs.nixvim = {
    enable = true;
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
        };
      };
    };
    highlight = {
      "@property" = { fg = "#${colors.base0D}"; }; 
      "@variable.builtin" = { fg = "#${colors.base09}"; }; 
      "@function.builtin" = { fg = "#${colors.base0C}"; }; 
      "@variable.parameter" = { fg = "#${colors.base08}"; }; 
      "@keyword" = { fg = "#${colors.base0E}"; }; 
      "@string" = { fg = "#${colors.base0B}"; }; 
      "@string.special.path" = { fg = "#${colors.base0B}"; };
      "@comment" = { fg = "#${colors.base03}"; italic = true; };
      "@lsp.type.property" = { fg = "#${colors.base0D}"; };
      "@lsp.type.variable" = { fg = "#${colors.base09}"; };
      "@lsp.type.function" = { fg = "#${colors.base0C}"; };
      "@lsp.type.parameter" = { fg = "#${colors.base08}"; };
    };
  };
}
