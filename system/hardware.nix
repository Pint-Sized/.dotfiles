{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:

{
  hardware = {

    graphics = {
      enable = true;
      enable32Bit = true;
    };

    openrazer = {
      enable = true;
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    nvidia = {
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };
  };
}
