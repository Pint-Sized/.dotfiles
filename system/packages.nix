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
      manix
      jq
      thunderbird
      nil
      rclone
      wttrbar
      feh
      teams-for-linux
      pyenv
      obs-studio
      pandoc
      shellcheck
      celluloid
      which

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


    ])

    ++

      (with pkgs-unstable; [
        zed-editor      # neovim plugins
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
