{
  pkgs,
  inputs,
  system,
  pkgs-unstable,
  userSettings,
  ...
}: {
  # -------- STABLE ------- #
  environment.systemPackages =
    (with pkgs; [
      traceroute
      kdePackages.ark
      zstd
      rpi-imager
      kdePackages.isoimagewriter
      base16-schemes
      black
      calligraphy
      celluloid
      discover-overlay
      fastfetch
      kdePackages.dolphin
      emote
      fragments
      gparted
      hunspell
      jq
      kitty
      libreoffice-qt6-fresh
      mediainfo
      hunspellDicts.en_GB-ize
      nautilus
      neovim
      nix-du
      nix-unit
      ntfs3g
      pavucontrol
      pokeget-rs
      prismlauncher
      python3
      quickgui
      ripgrep
      thunderbird
      tldr
      udisks
      unzip
      usbutils
      vencord
      volctl
      wev
      which
      wl-clipboard
      yazi
      zapzap
      zip

      nodejs_latest
      pandoc
    ])
    # ----- UNSTABLE ----- #
    ++ (with pkgs-unstable; [
      discord
      hyprpolkitagent
      lua
      nchat
      nix-output-monitor
    ])
    # ----- PYTHON-PACKAGES ----- #
    ++ (with pkgs.python312Packages; [
      libcst
      python-lsp-server
      pip
      psutil
    ])
    ++ (with inputs; [
      caelestia-shell.packages.x86_64-linux.default
    ]);

  services.flatpak.packages = [
    "io.github.giantpinkrobots.flatsweep"
    "com.usebottles.bottles"
    "io.frama.tractor.carburetor"
    "it.mijorus.whisper"
    "org.prismlauncher.PrismLauncher"
    "com.stremio.Stremio"
  ];

  programs = {
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "/home/${userSettings.username}/.dotfiles";
    };
    fish = {
      enable = true;
      package = pkgs.fish;
    };
    mtr = {
      enable = true;
      package = pkgs.mtr;
    };
    gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };
    nix-index-database = {
      comma.enable = true;
    };
    steam.enable = true;
    gamemode.enable = true;
    gamescope = {
      enable = true;
      capSysNice = true;
    };
  };
}
