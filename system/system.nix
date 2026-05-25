{
  pkgs,
  systemSettings,
  userSettings,
  ...
}:
{
  boot = {
    kernelPackages = pkgs.linuxPackages;
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      grub = {
        configurationLimit = 15;
        devices = [ "nodev" ];
        efiSupport = true;
        enable = true;
        useOSProber = true;
      };
      systemd-boot.enable = false;
      timeout = 3;
    };
    plymouth.enable = true;
  };

  console.keyMap = "us";
  documentation.man.generateCaches = false;

  environment = {
    sessionVariables = {
      MOZ_ENABLE_WAYLAND = "1";
      NIX_OZONE = "1";
      NIX_OZONE_WL = "1";
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
      WLR_NO_HARDWARE_CURSORS = "1";
    };
    variables = {
      EDITOR = "nvim";
      NIXPKGS_ALLOW_UNFREE = "1";
      SYSTEMD_EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  fonts = {
    fontconfig.defaultFonts = {
      monospace = [ "${userSettings.fontMono}" ];
      sansSerif = [ "${userSettings.fontSerif}" ];
      serif = [ "${userSettings.fontSerif}" ];
    };
    packages = with pkgs; [
      corefonts
      nerd-fonts._0xproto
      nerd-fonts.caskaydia-cove
      nerd-fonts.victor-mono
      nerd-fonts.geist-mono
      nerd-fonts.lilex
      nerd-fonts.commit-mono
      nerd-fonts.fantasque-sans-mono
      nerd-fonts.recursive-mono
      maple-mono.NF
      nerd-fonts.symbols-only
      vista-fonts
    ];
  };

  i18n = {
    defaultLocale = systemSettings.locale;
    extraLocaleSettings = {
      LANGUAGE = systemSettings.locale;
      LC_ALL = systemSettings.locale;
    };
  };

  nix.settings = {
    experimental-features = [
      "flakes"
      "nix-command"
    ];
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  security.rtkit.enable = true;
  time.timeZone = systemSettings.timezone;

  users.users.${userSettings.username} = {
    description = "${userSettings.name}";
    extraGroups = [
      "libvirtd"
      "networkmanager"
      "wheel"
    ];
    isNormalUser = true;
    shell = pkgs.fish;
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
  };
}
