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
      manix
      thunderbird
      python312Packages.simpleeval
      python312Packages.pint
      python312Packages.parsedatetime
      python312Packages.pytz
      htop
      rclone
      feh
      teams-for-linux
      pyenv
      obs-studio
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
      wineWowPackages.waylandFull
      openrazer-daemon
      polychromatic
      fzf
      python3
      wl-clipboard
      pyprland
      cliphist
      go
      xdg-utils
      ulauncher
      nixd
      wev
      rustdesk-flutter
      ntfs3g
      chezmoi
      yarn
      volctl
      waypaper
      mpc-cli
      fastfetch
      pokeget-rs
      cava
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
      hyprpaper
      vscode
      protonup
      hyprlock
      xdg-desktop-portal-hyprland
      gnome.nautilus
      wdisplays
      monitor
      lutris
      swww
      liquidctl
      deluge
      lm_sensors
      kdePackages.ark
      unzip
      zip
      cmake
      tk
      lxqt.lxqt-policykit
      ripgrep
      fd
      usbutils
      udisks
      coreutils
      clang
      btop
      onlyoffice-bin_latest
      loupe
      kdePackages.gwenview
      util-linux
      ungoogled-chromium
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
      newsboat
      speedread
      simplehttp2server
      doing
      neomutt
      gh-screensaver
      eza
      tre
      lsd
      hub
      cmatrix
      pipes-rs
      hyperfine
      tokei
      tldr
      gitui
      pueue
      onefetch
      bc
      redshift

    ])

    ++

      (with pkgs-unstable; [
        zed-editor
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
      "com.valvesoftware.Steam"
      "io.github.flattool.Warehouse"
      "com.rtosta.zapzap"
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

    gamescope = {
      enable = true;

    };

    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };

    gamemode = {
      enable = true;
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
    tmux = {
      enable = true;
    };
  };
}
