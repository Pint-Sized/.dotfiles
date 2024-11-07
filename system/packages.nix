{
  inputs,
  config,
  pkgs,
  lib,
  pkgs-unstable,
  ...
}:
{
  environment.systemPackages =
    (with pkgs; [
      jq
      thunderbird
      nil
      rclone
      wttrbar
      feh
      pyenv
      obs-studio
      pandoc
      shellcheck
      celluloid
      imv
      mpv
      libsForQt5.qt5ct
      kdePackages.qt6ct
      lm_sensors
      remnote
      neovim-unwrapped
      home-manager
      wineWowPackages.waylandFull
      bottles
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
      nixfmt-rfc-style
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
      kitty
      util-linux
      ungoogled-chromium
      appeditor
      gparted
      kdePackages.qt6ct
      glib
      nodejs_22
      gnome.gnome-calculator
      rustup
      gnumake
      libgcc
      yazi
      evince
      discord

      # fish plugins
      fishPlugins.done
      fishPlugins.sponge
      fishPlugins.puffer
      fishPlugins.autopair

      # neovim plugins
      vimPlugins.telescope-nvim
      vimPlugins.telescope-file-browser-nvim
      vimPlugins.nvim-lspconfig
      vimPlugins.nvim-cmp
      vimPlugins.fzf-lua
      vimPlugins.alpha-nvim
      vimPlugins.lspsaga-nvim
      vimPlugins.bufferline-nvim
      vimPlugins.nvim-treesitter
      vimPlugins.startup-nvim
    ])

    ++

      (with pkgs-unstable; [
        zed-editor
      ]);

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
  };
}
