{ ... }:
{
  programs.nixvim.plugins = {
    snacks = {
      enable = true;
      settings = {
        picker.enabled = true;
        explorer.enabled = true;
        bigfile.enabled = true;
      };
    };

  };
}
