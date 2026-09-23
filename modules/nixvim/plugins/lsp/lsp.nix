{ ... }:
{
  programs.nixvim.plugins = {
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
        jdtls.enable = true;
      };
    };

  };
}
