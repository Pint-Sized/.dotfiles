{
  inputs,
  config,
  pkgs,
  lib,
  catppuccin,
  ...
}:
{
  users.users.fionnbennett = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "Fionn Bennett";
    extraGroups = [
      "networkmanager"
      "wheel"
      "openrazer"
    ];
    packages = with pkgs; [ ];
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
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/user/.steam/root/compatibilitytoold.d";
    };
  };
  fonts.packages = with pkgs; [
    (nerdfonts.override {
      fonts = [
        "0xProto"
        "NerdFontsSymbolsOnly"
      ];
    })
  ];
  fonts.fontconfig = {
    defaultFonts = {
      serif = [ "0xProto Nerd Font" ];
      sansSerif = [ "0xProto Nerd Font" ];
      monospace = [ "0xProto Nerd Font" ];
    };
  };
  boot = {
    plymouth = {
      enable = true;
    };
    loader = {
      timeout = 3;
      systemd-boot.enable = false;
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot";
      grub = {
        enable = true;
        devices = [ "nodev" ];
        efiSupport = true;
        configurationLimit = 15;
      };
    };
  };
  time = {
    timeZone = "Europe/Dublin";
  };
  i18n = {
    defaultLocale = "en_IE.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_IE.UTF-8";
      LC_IDENTIFICATION = "en_IE.UTF-8";
      LC_MEASUREMENT = "en_IE.UTF-8";
      LC_MONETARY = "en_IE.UTF-8";
      LC_NAME = "en_IE.UTF-8";
      LC_NUMERIC = "en_IE.UTF-8";
      LC_PAPER = "en_IE.UTF-8";
      LC_TELEPHONE = "en_IE.UTF-8";
      LC_TIME = "en_IE.UTF-8";
      LC_ALL = "en_IE.UTF-8";
      LC_CTYPE = "en_IE.UTF-8";
      LC_COLLATE = "en_IE.UTF-8";
      LC_MESSAGES = "en_IE.UTF-8";
      LANGUAGE = "en_IE.UTF-8";

    };
  };
  console.keyMap = "us";
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
  xdg = {
    portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
    };
  };
  virtualisation = {
    libvirtd = {
      enable = true;
    };
  };
  security = {
    rtkit = {
      enable = true;
    };
  };
}
