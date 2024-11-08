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
     # telescope
     telescope = {
        enable = true;
        extensions = {
          file-browser.enable = true;
	  undo.enable = true;
	  media-files.enable = true;
	  manix.enable = true;
	  ui-select.enable = true;
        };
      };


      diffview.enable = true;
      oil.enable = true;
      lsp.enable = true;
      lspsaga.enable = true;
      bufferline.enable = true;
      neogit.enable = true;
      fzf-lua.enable = true;
      nui.enable = true;
      notify.enable = true;
      noice.enable = true;
      web-devicons.enable = true;

      neotest = {
	enable = true;
	adapters = {
	  plenary = {
		enable = true;
	  };
	};
      };



      cmp = {
        autoEnableSources = true;
        settings.sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
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
