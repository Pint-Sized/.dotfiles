{ ... }:
{
  programs.nixvim.plugins = {
    render-markdown = {
      enable = true;
      settings = {
        heading = {
          width = "block";
          position = "inline";
        };
        bullet.icons = [
          "•"
          "○"
          "◆"
          "◇"
        ];
        anti_conceal.enabled = true;
      };
    };

  };
}
