{
  pkgs,
  pkgs-unstable,
  catppuccin,
  lib,
  config,
  nixvim,
  ...
}:

{
  programs.nixvim = {
    plugins = {
      telescope = {
        enable = true;
        enabledExtensions = [];
      };

      lsp = {
        enable = true;
        inlayHints = false;
      };

      cmp = {
        autoEnableSources = true;
        settings.sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
      };

      fzf-lua = {
        enable = true;
      };

      alpha = {
        enable = true;
      };

      lspsaga = {
        enable = true;
      };

      bufferline = {
      enable = true;
      };

      treesitter = {
        enable = true;

        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          bash
          json
          lua
          make
          markdown
          nix
          regex
          toml
          vim
          vimdoc
          xml
          yaml
        ];
      };
    };
  };

}
