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
      appeditor
      bat
      base16-schemes
      black
      btop
      calligraphy
      cava
      celluloid
      cmatrix
      emote
      mediainfo
      fastfetch
      firefoxpwa
      foot
      fragments
      fzf
      git
      gnome-calculator
      gparted
      hyprlock
      imv
      kalker # calculator
      kdePackages.qt6ct
      librewolf
      libreoffice-qt6-fresh
      libsForQt5.qt5ct
      mpv
      nautilus
      neovide
      nix-du
      nixos-generators
      ntfs3g
      onlyoffice-desktopeditors
      pavucontrol
      playerctl
      pokeget-rs
      pyprland
      python
      python3
      rclone
      remnote
      ripgrep
      spotify
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
      vencord
      volctl
      waybar
      waypaper
      wdisplays
      wev
      which
      wl-clipboard
      wlogout
      yazi
      zapzap
      zathura
      zip

      #testing
      wiki-tui
      tuifimanager
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
        pip
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
      permittedInsecurePackages = [
        "python-2.7.18.8"
      ];
    };
  };
}
