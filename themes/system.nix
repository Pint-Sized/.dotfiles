{ pkgs, userSettings, ... }:

{
  stylix = {
    enable = true;
    autoEnable = true;
    enableReleaseChecks = false;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${userSettings.theme}.yaml";
    cursor.size = 16;
    targets.nixos-icons.enable = true;
  };
}
