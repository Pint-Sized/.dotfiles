{
  inputs,
  pkgs,
  pkgs-unstable,
  pkgs-master,
  userSettings,
  ...
}:
{
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    libsecret
    glib
  ];
  environment.systemPackages =
    (with pkgs; [
      tonearm
      high-tide
      kando
      bun
      gcc
      go
      jdk
      waybar
      steamtinkerlaunch
      pince
      home-manager
      usbview
      adwsteamgtk
      loupe
      hyprshade
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
      imv
      jq
      kdePackages.ark
      kitty
      libreoffice-qt6-fresh
      lm_sensors
      mediainfo
      mpv
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
      timg
      tldr
      udisks
      unixtools.net-tools
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
      hyprpolkitagent
      lua
      nchat
      nix-output-monitor
    ])
    ++ (with pkgs-master; [
      solaar
    ])
    ++ (with pkgs.python312Packages; [
      libcst
      pip
      psutil
      python-lsp-server
    ])
    ++ (with inputs; [
      hiresTI.packages.${pkgs.system}.default
    ]);
  programs = {
    git.enable = true;
    fish.enable = true;
    gamemode.enable = true;
    gamescope = {
      capSysNice = true;
      enable = true;
    };
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    mtr.enable = true;
    nh = {
      clean = {
        enable = true;
        extraArgs = "--keep-since 4d --keep 3";
      };
      enable = true;
      flake = "/home/${userSettings.username}/.dotfiles";
    };
    nix-index-database.comma.enable = true;
    #solaar = {
    #enable = true;
    #userService.enable = true;
    #};
    steam.enable = true;
  };
  services.flatpak.packages = [
    "com.usebottles.bottles"
    "io.github.giantpinkrobots.flatsweep"
    "it.mijorus.whisper"
    "org.prismlauncher.PrismLauncher"
    "com.stremio.Stremio"
  ];
}
