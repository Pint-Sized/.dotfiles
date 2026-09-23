{ ... }:
{
  programs.nixvim.plugins = {
    aerial = {
      enable = true;
      settings = {
        backends = [
          "lsp"
          "treesitter"
          "markdown"
          "man"
        ];
        filter_kind = false;
        layout = {
          default_direction = "right";
          max_width = 30;
          min_width = 30;
        };
        show_guides = false;
        icons = {
          Array = "󰅪 ";
          Boolean = "◩ ";
          Class = "󰠱 ";
          Constant = "󰏿 ";
          Constructor = " ";
          Enum = " ";
          EnumMember = " ";
          Event = " ";
          Field = "󰜢 ";
          File = "󰈙 ";
          Function = "󰊕 ";
          Interface = " ";
          Key = "󰌋 ";
          Method = "󰆧 ";
          Module = "󰏗 ";
          Namespace = "󰌗 ";
          Null = "󰟢 ";
          Number = "󰎠 ";
          Object = "󰅩 ";
          Operator = "󰆕 ";
          Package = "󰏖 ";
          Property = "󰜢 ";
          Reference = "󰈇 ";
          String = "󰀬 ";
          Struct = "󰙅 ";
          TypeParameter = "󰊄 ";
          Variable = "󰀫 ";
        };
      };
    };

  };
}
