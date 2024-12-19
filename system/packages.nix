{ inputs, config, pkgs, pkgs-unstable, lib, nix-flatpak, ... }: {

  # -------- STABLE ------- #
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
    rclone
    readline
    remnote
    ripgrep
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
    ulauncher
    undollar
    unzip
    upscayl
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
    base16-schemes
    home-manager
    hyprpolkitagent
    kitty
    neovim-unwrapped
    nixfmt-rfc-style
    spotify
    ts_query_ls
    wttrbar
    zapzap
    zed-editor
  ])

  ++

  # -------- HYPRLAND PLUGINS ---------- # 
  (with pkgs-unstable.hyprlandPlugins; [
    borders-plus-plus
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
    diffview-nvim
    fzf-lua
    indent-blankline-nvim
    lualine-nvim
    markdown-preview-nvim
    mini-nvim
    neo-tree-nvim
    neogit
    neotest
    neotest-plenary
    noice-nvim
    nui-nvim
    nvim-autopairs
    nvim-cmp
    nvim-cursorline
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
    ];
    overrides = {
      global = {
        Context.sockets = [
          "wayland" 
          "!x11" 
          "!fallback-x11"
        ];
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
  nixpkgs.config.allowUnfree = true;
}
