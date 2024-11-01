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
      EDITOR = "micro";
      SYSTEMD_EDITOR = "micro";
      VISUAL = "micro";
    };
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIX_OZONE = "1";
      NIX_OZONE_WL = "1";
      MOZ_ENABLE_WAYLAND = "1";
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/user/.steam/root/compatibilitytoold.d";
    };
  };

  fonts.packages = with pkgs; [ (nerdfonts.override { fonts = [ "0xProto" ]; }) ];
  fonts.fontconfig = {
    defaultFonts = {
      serif = [ "0xProto Nerd Font" ];
      sansSerif = [ "0xProto Nerd Font" ];
      monospace = [ "0xProto Nerd Font" ];
    };
  };

  catppuccin = {
    enable = true;
    accent = "mauve";
    flavor = "mocha";
  };

  boot = {
    plymouth = {
      catppuccin = {
        enable = true;
        flavor = "mocha";
      };
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
        # useOSProber = true;
        catppuccin = {
          enable = true;
          flavor = "mocha";
        };
      };
    };
  };

  time = {
    timeZone = "Europe/Dublin";
  };

  i18n = {
    defaultLocale = "en_GB.UTF-8";
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
    };
  };

  console = {
    catppuccin = {
      enable = true;
      flavor = "mocha";
    };
    keyMap = "us";
  };

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
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

  networking = {
    hostName = "sisyphus";
  };

  security = {
    rtkit = {
      enable = true;
    };
  };

  systemd = {
    extraConfig = ''
      DefaultTimeoutStopSec=3s
    '';
  };
}
