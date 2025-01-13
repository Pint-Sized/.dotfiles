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
      displayManager = {
        gdm = {
          enable = true;
          wayland = true;
          banner = ''
            hello  
          '';
        };
      };
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
  };
}
