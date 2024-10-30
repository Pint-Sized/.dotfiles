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
    python3
    wl-clipboard
    pyprland
    cliphist
    go
    xdg-utils
    ulauncher
    nixd
    discord
    wev
    zed-editor
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
    sublime
    gedit
    zathura
    bat
    brightnessctl
    swaynotificationcenter
    git
    wget
    waybar
    dunst
    libnotify
    hyprpaper
    rofi-wayland
    webcord-vencord
    vscode
    protonup
    hyprlock
    xdg-desktop-portal-hyprland
    kdePackages.polkit-kde-agent-1
    nautilus
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
    leafpad
    kdePackages.ark
    # nur.repos.nltch.spotify-adblock
    # nur.repos.nltch.ciscoPacketTracer8
    pkgs.gnome.gnome-keyring
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
    nwg-look
    kdePackages.qt6ct
    themix-gui
    glib
    nodejs_22
    freecad
    gnome-calculator
    woeusb
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

    coolercontrol = {
      enable = true;
      nvidiaSupport = true;
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
