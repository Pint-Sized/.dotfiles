{
  pkgs,
  inputs,
  pkgs-unstable,
  pkgs-master,
  systemSettings,
  ...
}:

{
  # -------- STABLE ------- #
  environment.systemPackages =
    (with pkgs; [
      android-tools
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
      dua
      emote
      exiftool
      mediainfo
      fastfetch
      fd
      file
      firefoxpwa
      foot
      fragments
      fzf
      git
      glib
      gnome-calculator
      gnumake
      go
      gparted
      gperf
      has
      hyprlock
      imv
      input-leap
      jq
      kalker # calculator
      kdePackages.kdenlive
      kdePackages.qt6ct
      librewolf
      libgcc
      libnotify
      libreoffice-qt6-fresh
      libsForQt5.qt5ct
      mesa
      meson
      mpv
      nautilus
      ncurses
      neovide
      nix-du
      nixos-generators
      nodejs_22
      ntfs3g
      onlyoffice-desktopeditors
      openssl
      pavucontrol
      playerctl
      pokeget-rs
      pyprland
      python
      python3
      python312
      rclone
      readline
      remnote
      ripgrep
      rubyPackages_3_3.sqlite3
      rustup
      scrcpy
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

      #testing
      discordo
      gnome-font-viewer
      glow
      chess-tui
      rpg-cli
      doctoc
      glow
      mdcat
      mdp
      haskellPackages.patat
      presenterm
      sc-im
      slides
      wiki-tui
      drawing
      tuifimanager
      google-fonts
      charm-freeze
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
    "io.github.hamza_algohary.Coulomb"
    "io.frama.tractor.carburetor"
    "it.mijorus.whisper"
    "in.srev.guiscrcpy"
    "eu.nokun.MirrorHall"
    "io.github.limo_app.limo"
    "io.github.ungoogled_software.ungoogled_chromium"
    "com.valvesoftware.Steam"
  ];

  programs = {
    hyprland = {
      enable = true;
      #package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      #portalPackage =
      #inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
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
