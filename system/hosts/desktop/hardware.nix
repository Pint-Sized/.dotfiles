{ config, pkgs, ... }:
{
  hardware = {
    nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    enableRedistributableFirmware = true;
    firmware = with pkgs; [
      linux-firmware
    ];
  };
  boot.kernelModules = [
    "btusb"
    "btmk"
  ];
}
