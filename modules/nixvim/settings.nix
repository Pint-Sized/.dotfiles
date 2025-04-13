{
  programs.nixvim.config = {
    clipboard = {
      providers.wl-copy.enable = true;
    };

    extraConfigLuaPost = ''
      vim.wo.fillchars='eob: '
    '';

    autoCmd = [
      {
        command = "set laststatus=0";
        event = [
          "BufEnter"
          "BufWinEnter"
        ];
      }
    ];

    opts = {
      number = false;
      laststatus = 0;
      relativenumber = false;
      clipboard = "unnamedplus";
      tabstop = 2;
      softtabstop = 2;
      showtabline = 1;
      expandtab = true;
      smartindent = true;
      shiftwidth = 2;
      breakindent = true;
      cursorline = false;
      scrolloff = 2;
      mouse = "a";
      foldmethod = "manual";
      foldenable = false;
      linebreak = true;
      spell = false;
      swapfile = false;
      termguicolors = true;
      splitbelow = true;
      splitkeep = "screen";
      splitright = true;
      cmdheight = 0;
    };
  };
}
