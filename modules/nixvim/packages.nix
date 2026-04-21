{pkgs-unstable, ...}: {
  home.packages = with pkgs-unstable; [
    gopls
    hclfmt
    markdown-oxide
    nixd
    nixfmt
    prettierd
    pyright
    basedpyright
    stylua
    yamllint
    yamlfmt
  ];
}
