{pkgs, ...}: {
  programs.nixvim.plugins.treesitter = {
    enable = true;
    autoLoad = false;
    settings = {
      highlight.enable = true;
      indent.enable = true;
      folding.enable = true;
    };
    nixvimInjections = true;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
  };
}
