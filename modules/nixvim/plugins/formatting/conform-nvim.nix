{ ... }:
{
  programs.nixvim.plugins = {
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

  };
}
