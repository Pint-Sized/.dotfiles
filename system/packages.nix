{
  pkgs,
  pkgs-unstable,
  pkgs-master,
  systemSettings,
  winapps,
  ...
}:
{
  # -------- STABLE ------- #
  environment.systemPackages =
    (with pkgs; [
      aerc
      appeditor
      asciiquarium-transparent
      bat
      base16-schemes
      black
      bonsai
      btop
      calligraphy
      cava
      ccache
      celluloid
      clang
      cliphist
      cmake
      cmatrix
      coreutils
      deluge
      dua
      emblem
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
      gnumake
      go
      gparted
      gperf
      has
      hyprland
      hyprlock
      imv
      jq
      kalker # calculator
      kdePackages.qt6ct
      libgcc
      libnotify
      libreoffice-qt6-fresh
      libsForQt5.qt5ct
      meson
      mpv
      nautilus
      ncurses
      newsflash
      nix-du
      nixos-generators
      nodejs_22
      ntfs3g
      nwg-displays
      onefetch
      openssl
      pavucontrol
      pipes-rs
      playerctl
      pokeget-rs
      protonup
      pyprland
      python3
      python312Packages.libcst
      python312Packages.python-lsp-server
      qemu
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
      wob
      yazi
      zapzap
      zathura
      zip
      zlib
      thunderbird
      xdg-desktop-portal-hyprland
    ])

    ++

      # ----- UNSTABLE ----- #
      (with pkgs-unstable; [
        discord
        gopls
        hclfmt
        home-manager
        hyprpolkitagent
        hyprpicker
        hyprshot
        kitty
        librewolf
        lua
        markdown-oxide
        neovim-unwrapped
        nixd
        nixfmt-rfc-style
        nix-output-monitor
        prettierd
        pyright
        stylua
        ulauncher
        wineWowPackages.waylandFull
        wttrbar
        yamllint
        yamlfmt
      ])

    ++

      (with pkgs-master; [
        nchat
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

      (with winapps.packages."${systemSettings.system}"; [
        winapps
        winapps-launcher
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
    "com.usebottles.bottles"
  ];

  programs = {
    hyprland = {
      enable = true;
      package = pkgs.hyprland;
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
      allowBroken = false;
    };
  };
}
