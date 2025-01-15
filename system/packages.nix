{ pkgs, pkgs-unstable, ... }:

{
  # -------- STABLE ------- #
  environment.systemPackages =
    (with pkgs; [
      appeditor
      bat
      base16-schemes
      black
      brightnessctl
      btop
      ccache
      celluloid
      clang
      cliphist
      cmake
      cool-retro-term
      coreutils
      cpu-x
      deluge
      discord
      dua
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
      liquidctl
      lm_sensors
      mpc-cli
      mpv
      ncurses
      nodejs_22
      ntfs3g
      onefetch
      openrazer-daemon
      openssl
      pandoc
      pavucontrol
      playerctl
      pokeget-rs
      polychromatic
      python3
      python312Packages.libcst
      python312Packages.python-lsp-server
      rclone
      readline
      remnote
      ripgrep
      rofi-wayland
      rubyPackages_3_3.sqlite3
      rustup
      shotwell
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

      #testing
      gnome-text-editor
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
        ts_query_ls
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
      (with pkgs-unstable.vimPlugins; [
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

  services.flatpak = {
    enable = true;
    update = {
      onActivation = true;
    };
    uninstallUnmanaged = true;
    packages = [
      "com.github.tchx84.Flatseal"
      "io.github.flattool.Warehouse"
      "org.onlyoffice.desktopeditors"
      "net.codelogistics.webapps"
      "at.vintagestory.VintageStory"
      "org.contourterminal.Contour"
    ];
    overrides = {
      global = {
        Environment = {
          XCURSOR_SIZE = "16";
          MOZ_ENABLE_WAYLAND = "1";
          NIX_OZONE_WL = "1";
          NIX_OZONE = "1";
        };
        Context = {
          filesystems = [
            "/usr/share/icons:ro"
            "~/.icons:ro"
          ];
        };
      };
    };
  };

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
