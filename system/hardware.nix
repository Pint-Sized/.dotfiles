{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:

{
  hardware = {

    nvidia = {
      modesetting = {
        enable = true;
      };
      powerManagement = {
        enable = false;
        finegrained = false;
      };
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      open = false;
    };

    opengl = {
      enable = true;
      driSupport32Bit = true;
    };

    openrazer = {
      enable = true;
    };
  };
}
