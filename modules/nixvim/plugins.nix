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
        extensions = {
          file-browser = {
            enable = true;
          };
        };
      };

      lsp = {
        enable = true;
        # inlayHints = false;
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

        startup = {
          enable = true;

          colors = {
            background = "#ffffff";
            foldedSection = "#ffffff";
          };

          sections = {
            header = {
              type = "text";
              oldfilesDirectory = false;
              align = "center";
              foldSection = false;
              title = "Header";
              margin = 5;
              content = [
                ""
                ""
                ""
                ""
                ""
              	""
                ""
                ""
                " ███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
                " ████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
                " ██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
                " ██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
                " ██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
                " ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
              ];
              highlight = "Statement";
              defaultColor = "";
              oldfilesAmount = 0;
            };

            body = {
              type = "mapping";
              oldfilesDirectory = false;
              align = "center";
              foldSection = false;
              title = "Menu";
              margin = 5;
              content = [
                [
                  " Find File"
                  "Telescope find_files"
                  "ff"
                ]
                [
                  "󰍉 Find Word"
                  "Telescope live_grep"
                  "fr"
                ]
                [
                  " Recent Files"
                  "Telescope oldfiles"
                  "fg"
                ]
                [
                  " File Browser"
                  "Telescope file_browser"
                  "fe"
                ]
                [
                  " Copilot Chat"
                  "CopilotChat"
                  "ct"
                ]
                [
                  "󰧑 SecondBrain"
                  "edit ~/projects/personal/SecondBrain"
                  "sb"
                ]
              ];
              highlight = "string";
              defaultColor = "";
              oldfilesAmount = 0;
            };
          };

          options = {
            paddings = [1 3];
          };

          parts = [
            "header"
            "body"
          ];
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
