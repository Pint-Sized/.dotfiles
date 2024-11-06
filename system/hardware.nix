{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:

{
  hardware = {

    opengl = {
      enable = true;
      driSupport32Bit = true;
    };
    openrazer = {
      enable = true;
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
}
