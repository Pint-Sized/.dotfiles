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
      aerc
      appeditor
      bat
      base16-schemes
      black
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
      dua
      eog
      exiftool
      mediainfo
      fastfetch
      fd
      figlet
      file
      firefoxpwa
      foot
      fzf
      git
      glib
      gnome-calculator
      gwenview
      nautilus
      gnumake
      go
      gparted
      gperf
      has
      hyprlock
      hyprpaper
      hyprpicker
      imv
      jq
      kdePackages.qt6ct
      libgcc
      libnotify
      libreoffice-qt6-fresh
      librewolf
      libsForQt5.qt5ct
      meson
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
      spotify
      sqlite
      statix
      swaynotificationcenter
      swayosd
      swww
      teams-for-linux
      #tk
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
      #wget
      whatsie
      which
      wl-clipboard
      wlogout
      xdg-desktop-portal-hyprland
      #xdg-utils
      yazi
      zathura
      zip
      zlib
      thunderbird
    ])

    ++

      # ----- UNSTABLE ----- #
      (with pkgs-unstable; [
        discord
        gopls
        hclfmt
        home-manager
        hyprpolkitagent
        hyprsysteminfo
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
        vencord
        wttrbar
        yamllint
        yamlfmt
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
