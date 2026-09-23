{ ... }:
{
  imports = [
    ./settings.nix
    ./plugins/plugins.nix
  ];

  programs.nixvim.enable = true;
}
