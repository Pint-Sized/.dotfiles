{
  pkgs,
  pkgs-unstable,
  userSettings,
  ...
}:
{
  environment.systemPackages =
    (with pkgs; [
      appeditor
      black
      calligraphy
      celluloid
      discover-overlay
      emote
      fastfetch
      fragments
      gnome-calculator
      gparted
      hunspell
      hunspellDicts.en_GB-ise
      jq
      kdePackages.ark
      kdePackages.dolphin
      kitty
      libreoffice-qt6-fresh
      lm_sensors
      mediainfo
      nautilus
      neovim
      nix-du
      nix-unit
      nodejs_latest
      ntfs3g
      onefetch
      pandoc
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
      wget
      which
      wl-clipboard
      yazi
      zapzap
      zip
    ])
    ++ (with pkgs-unstable; [
      discord
      hyprpolkitagent
      lua
      nchat
      nix-output-monitor
    ])
    ++ (with pkgs.python312Packages; [
      libcst
      pip
      psutil
      python-lsp-server
    ]);

  programs = {
    fish.enable = true;

    gamemode.enable = true;

    gamescope = {
      enable = true;
      capSysNice = true;
    };

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    mtr.enable = true;

    nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep-since 4d --keep 3";
      };
      flake = "/home/${userSettings.username}/.dotfiles";
    };

    nix-index-database.comma.enable = true;

    steam.enable = true;
  };

  services.flatpak.packages = [
    "com.stremio.Stremio"
    "com.usebottles.bottles"
    "io.github.giantpinkrobots.flatsweep"
    "it.mijorus.whisper"
    "org.prismlauncher.PrismLauncher"
  ];
}
