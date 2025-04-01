{
  pkgs,
  pkgs-unstable,
  pkgs-master,
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
      btop
      calligraphy
      cava
      ccache
      celluloid
      clang
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
      gnome-text-editor
      gnumake
      go
      gparted
      gperf
      has
      hyprland
      hyprlock
      imv
      iotas
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
      nautilus-open-any-terminal
      ncurses
      newsflash
      nix-du
      nixos-generators
      nodejs_22
      ntfs3g
      onefetch
      openssl
      pavucontrol
      playerctl
      pokeget-rs
      pyprland
      python
      python3
      python312
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
      thunderbird
      tldr
      udisks
      undollar
      unzip
      usbutils
      util-linux
      vencord
      volctl
      vscodium
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
      xdg-desktop-portal-hyprland

      # ---- TESTING ---- #
      kando
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
        wttrbar
        yamllint
        yamlfmt
      ])

    ++

      (with pkgs.python312Packages; [
        libcst
        python-lsp-server
        numpy
        numpy_1
        numpy_2
        numpyro
        numpy-stl
        numpy-groupies
        pip
        pandas
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
      ]);

  services.flatpak.packages = [
    "io.github.giantpinkrobots.flatsweep"
    "com.usebottles.bottles"
    "net.nokyan.Resources"
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
      permittedInsecurePackages = [
        "python-2.7.18.8"
      ];
    };
  };
}
