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
        kotlin_language_server.enable = true;
        csharp_ls.enable = true;
        phpactor.enable = true;
        ruby_lsp.enable = true;
        elixirls.enable = true;
        hls = {
          enable = true;
          installGhc = true;
        };
        zls.enable = true;
        dartls.enable = true;
        ocamllsp.enable = true;
        clojure_lsp.enable = true;
        ruff.enable = true;
        eslint.enable = true;
        tailwindcss.enable = true;
        svelte.enable = true;
        vue_ls.enable = true;
        graphql.enable = true;
        lemminx.enable = true;
        sqls.enable = true;
        dockerls.enable = true;
        docker_compose_language_service.enable = true;
        terraformls.enable = true;
        cmake.enable = true;
        texlab.enable = true;
        fish_lsp.enable = true;
      };
    };

  };
}
