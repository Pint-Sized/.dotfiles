{
  config,
  pkgs,
  catppuccin,
  lib,
  ...
}:

{
  # ---------- MICRO ----------- #
  programs.micro = {
    enable = true;
    catppuccin.enable = false;
    settings = {
          "autoclose"= true;
          "autoindent"= true;
          "autosave"= 0;
          "autosu"= true;
          "backup"= true;
          "backupdir"= "";
          "basename"= false;
          "clipboard"= "external";
          "colorcolumn"= 0;
          "colorscheme"= "catppuccin-mocha-transparent";
          "comment"= true;
          "cursorline"= true;
          "diff"= true;
          "diffgutter"= false;
          "divchars"= "|-";
          "divreverse"= true;
          "encoding"= "utf-8";
          "eofnewline"= true;
          "fastdirty"= false;
          "fileformat"= "unix";
          "filetype"= "unknown";
          "incsearch"= true;
          "ftoptions"= true;
          "ignorecase"= true;
          "indentchar"= " ";
          "infobar"= true;
          "initlua"= true;
          "keepautoindent"= false;
          "keymenu"= false;
          "linter"= true;
          "literate"= true;
          "matchbrace"= true;
          "matchbraceleft"= true;
          "matchbracestyle"= "underline";
          "mkparents"= false;
          "mouse"= true;
          "parsecursor"= false;
          "paste"= false;
          "permbackup"= false;
          "pluginrepos"= [
            "https://codeberg.org/micro-plugins/filemanager2/raw/branch/main/repo.json"
          ];
          "readonly"= false;
          "relativeruler"= false;
          "rmtrailingws"= false;
          "ruler"= true;
          "savecursor"= false;
          "savehistory"= true;
          "saveundo"= false;
          "scrollbar"= false;
          "scrollmargin"= 3;
          "scrollspeed"= 2;
          "smartpaste"= true;
          "softwrap"= false;
          "splitbottom"= true;
          "splitright"= true;
          "status"= true;
          "statusformatl"= "$(filename) $(modified)($(line),$(col)) $(status.paste)| ft:$(opt:filetype) | $(opt:fileformat) | $(opt:encoding)";
          "statusformatr"= "$(bind:ToggleKeyMenu): bindings, $(bind:ToggleHelp): help";
          "statusline"= true;
          "sucmd"= "sudo";
          "syntax"= true;
          "tabmovement"= false;
          "tabhighlight"= true;
          "tabreverse"= false;
          "tabsize"= 4;
          "tabstospaces"= false;
          "useprimary"= true;
          "xterm"= false;
          
          "filemanager2.openonstart" = false;
          "filemanager2.nerdfonts" = true;


          "lsp.server"= "nix=nil,python=pyls,go=gopls,typescript=deno lsp,rust=rust-analyzer";
          "lsp.formatOnSave"= true;
          "lsp.ignoreMessages"= "LS message1 to ignore|LS message 2 to ignore|...";
          "lsp.tabcompletion"= true;
          "lsp.ignoreTriggerCharacters"= "completion,signature";
          "lsp.autocompleteDetails"= false;
    };
  };
  
  home.file = {
  	".config/micro/colorschemes/catppuccin-mocha-transparent.micro" = {
  		text = ''
  		  color-link default "#cdd6f4,#1e1e2e00"
  		  color-link comment "#9399b2"
  		  
  		  color-link identifier "#89b4fa"
  		  color-link identifier.class "#89b4fa"
  		  color-link identifier.var "#89b4fa"
  		  
  		  color-link constant "#fab387"
  		  color-link constant.number "#fab387"
  		  color-link constant.string "#a6e3a1"
  		  
  		  color-link symbol "#f5c2e7"
  		  color-link symbol.brackets "#f2cdcd"
  		  color-link symbol.tag "#89b4fa"
  		  
  		  color-link type "#89b4fa"
  		  color-link type.keyword "#f9e2af"
  		  
  		  color-link special "#cba6f7"
  		  color-link statement "#cba6f7"
  		  color-link preproc "#f5c2e7"
  		  
  		  color-link underlined "#89dceb"
  		  color-link error "bold #f38ba8"
  		  color-link todo "bold #f9e2af"
  		  
  		  color-link diff-added "#a6e3a1"
  		  color-link diff-modified "#f9e2af"
  		  color-link diff-deleted "#f38ba8"
  		  
  		  color-link gutter-error "#f38ba8"
  		  color-link gutter-warning "#f9e2af"
  		  
  		  color-link statusline "#cdd6f4,#181825"
  		  color-link tabbar "#cdd6f4,#181825"
  		  color-link indent-char "#45475a"
  		  color-link line-number "#45475a"
  		  color-link current-line-number "#b4befe"
  		  
  		  color-link cursor-line "#313244,#cdd6f4"
  		  color-link color-column "#313244"
  		  color-link type.extended "default"
  		'';
  	};
  };
}
