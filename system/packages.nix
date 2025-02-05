{
  pkgs,
  pkgs-unstable,
  #nix-software-center,
  #nixos-conf-editor,
  ...
}:
{
  # -------- STABLE ------- #
  environment.systemPackages =
    (with pkgs; [
      appeditor
      bat
      base16-schemes
      black
      bottom
      btop
      cava
      cavalier
      ccache
      celluloid
      clang
      cliphist
      cmake
      coreutils
      deluge
      discord
      dua
      eog
      exiftool
      mediainfo
      fastfetch
      fd
      figlet
      file
      firefoxpwa
      fzf
      git
      glib
      gnome-calculator
      nautilus
      gnumake
      go
      gparted
      gperf
      has
      imv
      jq
      kdePackages.qt6ct
      libgcc
      libnotify
      libreoffice-qt6-fresh
      librewolf
      libsForQt5.qt5ct
      mangohud
      monitor
      mpc-cli
      mpv
      ncurses
      nix-du
      #nixos-conf-editor.packages.${system}.nixos-conf-editor
      #nix-software-center.packages.${system}.nix-software-center
      nixos-generators
      nodejs_22
      ntfs3g
      onefetch
      openssl
      pandoc
      pavucontrol
      playerctl
      pokeget-rs
      pyprland
      python3
      python312Packages.libcst
      python312Packages.python-lsp-server
      rclone
      readline
      remnote
      ripgrep
      rubyPackages_3_3.sqlite3
      rustup
      shotwell
      spotify
      sqlite
      sqlite-interactive
      swaynotificationcenter
      swayosd
      swww
      tk
      tldr
      udisks
      undollar
      unzip
      usbutils
      util-linux
      volctl
      waybar
      waypaper
      wdisplays
      wev
      wget
      which
      wl-clipboard
      wlogout
      wob
      xdg-desktop-portal-hyprland
      xdg-utils
      yarn
      yazi
      zathura
      zip
      zlib
      thunderbird
    ])

    ++

      # ----- UNSTABLE ----- #
      (with pkgs-unstable; [
        gopls
        hclfmt
        home-manager
        hyprpolkitagent
        kitty
        lua
        markdown-oxide
        neovim-unwrapped
        nixd
        nixfmt-rfc-style
        prettierd
        pyright
        stylua
        ulauncher
        wttrbar
        yamllint
        yamlfmt
        zapzap
        zed-editor
      ])

    ++

      # --------- FISH PLUGINS --------- #
      (with pkgs-unstable.fishPlugins; [
        autopair
        done
        puffer
        sponge
      ])

    ++

      # --------- VIM PLUGINS --------- #
      (with pkgs.vimPlugins; [
        bufferline-nvim
        conform-nvim
        diffview-nvim
        fzf-lua
        indent-blankline-nvim
        lualine-nvim
        lspsaga-nvim
        markdown-preview-nvim
        mini-nvim
        neo-tree-nvim
        neogit
        neotest
        neotest-plenary
        noice-nvim
        none-ls-nvim
        nui-nvim
        nvim-autopairs
        nvim-cmp
        nvim-cursorline
        nvim-lspconfig
        nvim-navic
        nvim-notify
        nvim-snippets
        nvim-treesitter
        nvim-web-devicons
        oil-nvim
        startup-nvim
        telescope-file-browser-nvim
        telescope-manix
        telescope-media-files-nvim
        telescope-nvim
        telescope-ui-select-nvim
        telescope-undo-nvim
        todo-comments-nvim
        toggleterm-nvim
        trouble-nvim
        vim-illuminate
        which-key-nvim
      ]);

  services.flatpak.packages = [
    "com.github.tchx84.Flatseal"
    "io.github.flattool.Warehouse"
  ];

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    fish.enable = true;

    mtr.enable = true;

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
      allowBroken = true;
    };
  };
}
