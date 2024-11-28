{
  inputs,
  config,
  pkgs,
  pkgs-unstable,
  lib,
  nix-flatpak,
  ...
}:
{
  environment.systemPackages =
    (with pkgs; [
      thunderbird
      python312Packages.simpleeval
      python312Packages.pint
      python312Packages.parsedatetime
      python312Packages.pytz
      rclone
      feh
      pyenv
      pandoc
      celluloid
      which
      imv
      mpv
      hyprlandPlugins.borders-plus-plus
      libsForQt5.qt5ct
      kdePackages.qt6ct
      lm_sensors
      remnote
      openrazer-daemon
      polychromatic
      fzf
      python3
      wl-clipboard
      cliphist
      go
      xdg-utils
      ulauncher
      ccache
      file
      gperf
      python312Packages.help2man
      ncurses
      openssl
      readline
      sqlite
      zlib
      nixd
      wev
      ntfs3g
      yarn
      volctl
      waypaper
      mpc-cli
      fastfetch
      pokeget-rs
      brightnessctl
      pavucontrol
      figlet
      playerctl
      wlogout
      zathura
      bat
      brightnessctl
      swaynotificationcenter
      git
      wget
      waybar
      libnotify
      protonup
      xdg-desktop-portal-hyprland
      gnome.nautilus
      wdisplays
      monitor
      swww
      liquidctl
      deluge
      lm_sensors
      kdePackages.ark
      unzip
      zip
      cmake
      rubyPackages_3_3.sqlite3
      sqlite-interactive
      tk
      lxqt.lxqt-policykit
      ripgrep
      fd
      usbutils
      udisks
      coreutils
      clang
      btop
      loupe
      util-linux
      appeditor
      gparted
      kdePackages.qt6ct
      glib
      nodejs_22
      gnome-calculator
      rustup
      gnumake
      libgcc
      yazi
      evince
      discord
      
      # fish plugins
      fishPlugins.autopair
      fishPlugins.done
      fishPlugins.sponge
      fishPlugins.puffer

      # testing
      speedread
      neomutt
      tokei
      tldr
      pueue
      onefetch

    ])

    ++

      (with pkgs-unstable; [
        neovim-unwrapped
        home-manager
        wttrbar
        kitty
        base16-schemes
        
        # neovim plugins
        vimPlugins.telescope-nvim
        vimPlugins.telescope-file-browser-nvim
        vimPlugins.nvim-lspconfig
        vimPlugins.nvim-cmp
        vimPlugins.fzf-lua
        vimPlugins.lspsaga-nvim
        vimPlugins.bufferline-nvim
        vimPlugins.nvim-treesitter
        vimPlugins.startup-nvim
        vimPlugins.neogit
        vimPlugins.diffview-nvim
        vimPlugins.neotest
        vimPlugins.neotest-plenary
        vimPlugins.oil-nvim
        vimPlugins.telescope-undo-nvim
        vimPlugins.telescope-media-files-nvim
        vimPlugins.telescope-manix
        vimPlugins.telescope-ui-select-nvim
        vimPlugins.nui-nvim
        vimPlugins.nvim-notify
        vimPlugins.noice-nvim
        vimPlugins.nvim-web-devicons
        vimPlugins.nvim-autopairs
        vimPlugins.nvim-cursorline
        vimPlugins.vim-illuminate
        vimPlugins.indent-blankline-nvim
        vimPlugins.nvim-navic
        vimPlugins.neo-tree-nvim
        vimPlugins.todo-comments-nvim
        vimPlugins.nvim-snippets
        vimPlugins.lualine-nvim
        vimPlugins.markdown-preview-nvim
        vimPlugins.mini-nvim
        vimPlugins.toggleterm-nvim
        vimPlugins.which-key-nvim
        vimPlugins.lspkind-nvim
        vimPlugins.lspkind-nvim
        vimPlugins.lspkind-nvim
        vimPlugins.lspkind-nvim
        vimPlugins.lspkind-nvim
        
        black
        vscode-langservers-extracted
        lua-language-server
        nil
        typescript-language-server
        marksman
        pyright
        gopls
        terraform-ls
        ansible-language-server
        helm-ls
        yaml-language-server
        isort
        nixfmt-rfc-style
        alejandra
        jq
        prettierd
        stylua
        shellcheck
        shfmt
        shellharden
        bicep
        yamlfmt
        zed-editor
        nushell
      ]);

  services.flatpak = {
    enable = true;
    update = {
      auto = {
        enable = true;
        onCalendar = "weekly";
      };
      onActivation = false;
    };
    uninstallUnmanaged = true;
    packages = [
      "com.github.tchx84.Flatseal"
      "io.gitlab.librewolf-community"
      "io.github.flattool.Warehouse"
      "org.onlyoffice.desktopeditors"
      "org.chromium.Chromium"
    ];
  };

  programs = {

    virt-manager = {
      enable = true;
    };

    hyprland = {
      enable = true;
      xwayland = {
        enable = true;
      };
    };

    fish = {
      enable = true;
    };

    mtr = {
      enable = true;
    };

    gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };
  };
  
  # ------ NIXPKGS SETTINGS ------ #
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
}
