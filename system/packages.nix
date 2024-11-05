{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    rclone
    imv
    foot
    nushell
    zed
    lm_sensors
    remnote
    vimPlugins.nvchad-ui
    neovim
    home-manager
    wineWowPackages.waylandFull
  	bottles
  	openrazer-daemon
  	polychromatic
  	fzf
    python3
    fishPlugins.done
    fishPlugins.sponge
    fishPlugins.puffer
    fishPlugins.autopair
    wl-clipboard
    pyprland
    cliphist
    go
    xdg-utils
    ulauncher
    nixd
    discord
    wev
    # zed-editor
    rustdesk-flutter
    ntfs3g
    chezmoi
    yarn
    volctl
    waypaper
    wttrbar
    mpc-cli
    fastfetch
    pokeget-rs
    cava
    brightnessctl
    pavucontrol
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
    rofi-wayland
    webcord-vencord
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
    way-displays
    hyprpicker
    lm_sensors
    kdePackages.ark
    # nur.repos.nltch.spotify-adblock
    # nur.repos.nltch.ciscoPacketTracer8
    # pkgs.gnome-keyring
    unzip
    zip
    cmake
    tk
    hyprshot
    lxqt.lxqt-policykit
    ripgrep
    fd
    emacs
    usbutils
    udisks
    coreutils
    clang
    micro
    btop
    onlyoffice-bin_latest
    loupe
    kdePackages.gwenview
    kitty
    util-linux
    ungoogled-chromium
    appeditor
    gparted
    mediawriter
    kdePackages.qt6ct
    glib
    nodejs_22
    freecad
    gnome.gnome-calculator
    rustup
    gnumake
    libgcc
    yazi
    evince
  ];

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








