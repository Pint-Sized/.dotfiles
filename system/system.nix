{
  pkgs,
  systemSettings,
  userSettings,
  ...
}: {
  users.users.${userSettings.username} = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "${userSettings.name}";
    extraGroups = [
      "networkmanager"
      "wheel"
      "openrazer"
      "libvirtd"
    ];
  };
  environment = {
    variables = {
      EDITOR = "nvim";
      SYSTEMD_EDITOR = "nvim";
      VISUAL = "nvim";
      NIXPKGS_ALLOW_UNFREE = 1;
    };
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIX_OZONE = "1";
      NIX_OZONE_WL = "1";
      MOZ_ENABLE_WAYLAND = "1";
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    };
  };
  fonts.packages = with pkgs; [
    corefonts
    nerd-fonts.caskaydia-cove
    vistafonts
    nerd-fonts._0xproto
    nerd-fonts.symbols-only
  ];

  fonts.fontconfig.defaultFonts = {
    serif = ["0xProto Nerd Font"];
    sansSerif = ["0xProto Nerd Font"];
    monospace = ["0xProto Nerd Font"];
  };
  boot = {
    plymouth.enable = true;
    kernelPackages = pkgs.linuxPackages;
    loader = {
      timeout = 3;
      systemd-boot.enable = false;
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot";
      grub = {
        enable = true;
        devices = ["nodev"];
        efiSupport = true;
        configurationLimit = 15;
      };
    };
  };
  time.timeZone = systemSettings.timezone;
  i18n = {
    defaultLocale = "${systemSettings.locale}";
    extraLocaleSettings = {
      LC_ADDRESS = "${systemSettings.locale}";
      LC_IDENTIFICATION = "${systemSettings.locale}";
      LC_MEASUREMENT = "${systemSettings.locale}";
      LC_MONETARY = "${systemSettings.locale}";
      LC_NAME = "${systemSettings.locale}";
      LC_NUMERIC = "${systemSettings.locale}";
      LC_PAPER = "${systemSettings.locale}";
      LC_TELEPHONE = "${systemSettings.locale}";
      LC_TIME = "${systemSettings.locale}";
      LC_ALL = "${systemSettings.locale}";
      LC_CTYPE = "${systemSettings.locale}";
      LC_COLLATE = "${systemSettings.locale}";
      LC_MESSAGES = "${systemSettings.locale}";
      LANGUAGE = "${systemSettings.locale}";
    };
  };
  console.keyMap = "us";
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
  security.rtkit.enable = true;
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
  };
  documentation.man.generateCaches = false;
}
