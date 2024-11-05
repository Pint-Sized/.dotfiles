{
  config,
  pkgs,
  catppuccin,
  lib,
  ...
}:

{
  # ------ ZATHURA ---- #
  programs.zathura = {
    enable = true;
    catppuccin = {
      enable = true;
      flavor = "mocha";
    };
  };

}
