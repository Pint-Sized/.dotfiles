{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:

{
  services = {

    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];
    };

    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
        package = pkgs.kdePackages.sddm;
      };
    };

    xserver = {
      libinput = {
        mouse = {
          accelProfile = "flat";
        };
      };
      layout = "us";
      xkbVariant = "";
    };

    udisks2 = {
      enable = true;
    };

    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse = {
        enable = true;
      };
      jack = {
        enable = true;
      };
    };

    gvfs = {
      enable = true;
    };

    devmon = {
      enable = true;
    };

    openssh = {
      enable = true;
    };
    blueman = {
      enable = true;
    };
    emacs = {
      enable = true;
      package = pkgs.emacs;
    };
  };
}
