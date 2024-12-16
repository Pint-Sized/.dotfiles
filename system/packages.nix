{ inputs, config, pkgs, pkgs-unstable, lib, nix-flatpak, ... }: {
  environment.systemPackages = (with pkgs; [
    appeditor
    bat
    brightnessctl
    btop
    ccache
    celluloid
    clang
    cliphist
    cmake
    coreutils
    deluge
    discord
    dua
    fastfetch
    fd
    figlet
    file
    fishPlugins.autopair
    fishPlugins.done
    fishPlugins.puffer
    fishPlugins.sponge
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
    hyprlandPlugins.borders-plus-plus
    imv
    jq
    kdePackages.ark
    kdePackages.gwenview
    kdePackages.qt6ct
    kdePackages.qt6ct
    libgcc
    libnotify
    libreoffice-qt6-fresh
    librewolf
    libsForQt5.qt5ct
    liquidctl
    lm_sensors
    lm_sensors
    loupe
    lxqt.lxqt-policykit
    monitor
    mpc-cli
    mpv
    nautilus-open-any-terminal
    ncurses
    nixd
    nodejs_22
    nodePackages_latest.fkill-cli
    ntfs3g
    onefetch
    openrazer-daemon
    openssl
    pandoc
    pavucontrol
    playerctl
    playwright-test
    pokeget-rs
    polychromatic
    protonup
    python3
    python312Packages.help2man
    rclone
    readline
    remnote
    ripgrep
    rubyPackages_3_3.sqlite3
    rustup
    speedread
    sqlite
    sqlite-interactive
    sushi
    swaynotificationcenter
    swayosd
    swww
    tk
    tldr
    udisks
    ulauncher
    undollar
    unzip
    usbutils
    util-linux
    volctl
    waybar
    waypaper
    wdisplays
    wego
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

  (with pkgs-unstable; [
    base16-schemes
    bicep
    black
    home-manager
    hyprpolkitagent
    kitty
    neovim-unwrapped
    nixfmt-rfc-style
    shellcheck
    shellharden
    shfmt
    ts_query_ls
    vimPlugins.bufferline-nvim
    vimPlugins.diffview-nvim
    vimPlugins.fzf-lua
    vimPlugins.indent-blankline-nvim
    vimPlugins.lualine-nvim
    vimPlugins.markdown-preview-nvim
    vimPlugins.mini-nvim
    vimPlugins.neo-tree-nvim
    vimPlugins.neogit
    vimPlugins.neotest
    vimPlugins.neotest-plenary
    vimPlugins.noice-nvim
    vimPlugins.nui-nvim
    vimPlugins.nvim-autopairs
    vimPlugins.nvim-cmp
    vimPlugins.nvim-cursorline
    vimPlugins.nvim-navic
    vimPlugins.nvim-notify
    vimPlugins.nvim-snippets
    vimPlugins.nvim-treesitter
    vimPlugins.nvim-web-devicons
    vimPlugins.oil-nvim
    vimPlugins.startup-nvim
    vimPlugins.telescope-file-browser-nvim
    vimPlugins.telescope-manix
    vimPlugins.telescope-media-files-nvim
    vimPlugins.telescope-nvim
    vimPlugins.telescope-ui-select-nvim
    vimPlugins.telescope-undo-nvim
    vimPlugins.todo-comments-nvim
    vimPlugins.toggleterm-nvim
    vimPlugins.vim-illuminate
    vimPlugins.which-key-nvim
    vscodium
    wttrbar
    yamlfmt
    zapzap
    zed-editor
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
      "io.github.flattool.Warehouse"
      "org.onlyoffice.desktopeditors"
      "com.google.Chrome"
      "com.github.IsmaelMartinez.teams_for_linux"
    ];
  };

  programs = {

    hyprland = {
      enable = true;
      xwayland = { enable = true; };
    };

    fish = { enable = true; };

    mtr = { enable = true; };

    gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };
  };

  # ------ NIXPKGS SETTINGS ------ #
  nixpkgs = { config = { allowUnfree = true; }; };
}
