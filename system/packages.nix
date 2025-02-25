{
  pkgs,
  pkgs-unstable,
  ...
}:
{
  # -------- STABLE ------- #
  environment.systemPackages =
    (with pkgs; [
      aerc
      appeditor
      bat
      base16-schemes
      black
      btop
      calligraphy
      cava
      cavalier
      ccache
      celluloid
      clang
      cliphist
      cmake
      coreutils
      deluge
      dua
      emblem
      eog
      exiftool
      mediainfo
      fastfetch
      fd
      file
      firefoxpwa
      foot
      fzf
      git
      glib
      gnome-calculator
      gwenview
      gnumake
      go
      gparted
      gperf
      has
      hyprlock
      hyprpaper
      hyprpicker
      hyprshot
      imv
      jq
      kalker
      kdePackages.qt6ct
      libgcc
      libnotify
      libreoffice-qt6-fresh
      librewolf
      libsForQt5.qt5ct
      lsd
      meson
      mpc-cli
      mpv
      nautilus
      ncurses
      nix-du
      nixos-generators
      nodejs_22
      ntfs3g
      onefetch
      openssl
      pavucontrol
      playerctl
      pokeget-rs
      protonup
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
      spotify
      sqlite
      statix
      swaynotificationcenter
      swayosd
      swww
      teams-for-linux
      tldr
      udisks
      undollar
      unzip
      usbutils
      util-linux
      vencord
      volctl
      waybar
      waypaper
      wdisplays
      wev
      which
      wl-clipboard
      wlogout
      xdg-desktop-portal-hyprland
      yazi
      zapzap
      zathura
      zip
      zlib
      thunderbird

      # ----- TESTING ----- #
      iotas
      newsflash
      smenu
      pmenu
      television
      eureka-ideas
      jot
      noteshrink
      tui-journal
    ])

    ++

      # ----- UNSTABLE ----- #
      (with pkgs-unstable; [
        discord
        gopls
        hclfmt
        home-manager
        hyprpolkitagent
        kitty
        lua
        markdown-oxide
        nchat
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
    #"com.rtosta.zapzap"
    "io.github.giantpinkrobots.flatsweep"
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
