{
  userSettings,
  pkgs,
  config,
  ...
}:
{
  imports = [ ./themes/${userSettings.theme}.nix ];
  stylix = {
    enable = true;
    cursor = {
      name = userSettings.cursorName;
      package = pkgs.bibata-cursors;
      size = 16;
    };
    fonts = {
      serif.name = userSettings.fontMono;
      sansSerif.name = userSettings.fontMono;
      monospace.name = userSettings.fontMono;
      sizes.terminal = 11;
    };
    targets = {
      hyprland.enable = false;
      waybar.enable = false;
      hyprlock.enable = false;
      gtk.flatpakSupport.enable = true;
      foot.enable = false;
      xresources.enable = true;
      firefox.profileNames = [ "8b2kzims.default" ];
      zathura.enable = false;
      nixvim = {
        enable = true;
        plugin = "base16-nvim";
      };
    };
  };
  home.file.".colours.txt".text = with config.lib.stylix.colors; ''
    base00  ->  #${colors.base00-hex}  ->   rgb(${colors.base00-rgb-r}, ${colors.base00-rgb-g}, ${colors.base00-rgb-b})
    base01  ->  #${colors.base01-hex}  ->   rgb(${colors.base01-rgb-r}, ${colors.base01-rgb-g}, ${colors.base01-rgb-b})
    base02  ->  #${colors.base02-hex}  ->   rgb(${colors.base02-rgb-r}, ${colors.base02-rgb-g}, ${colors.base02-rgb-b})
    base03  ->  #${colors.base03-hex}  ->   rgb(${colors.base03-rgb-r}, ${colors.base03-rgb-g}, ${colors.base03-rgb-b})
    base04  ->  #${colors.base04-hex}  ->   rgb(${colors.base04-rgb-r}, ${colors.base04-rgb-g}, ${colors.base04-rgb-b})
    base05  ->  #${colors.base05-hex}  ->   rgb(${colors.base05-rgb-r}, ${colors.base05-rgb-g}, ${colors.base05-rgb-b})
    base06  ->  #${colors.base06-hex}  ->   rgb(${colors.base06-rgb-r}, ${colors.base06-rgb-g}, ${colors.base06-rgb-b})
    base07  ->  #${colors.base07-hex}  ->   rgb(${colors.base07-rgb-r}, ${colors.base07-rgb-g}, ${colors.base07-rgb-b})
    base08  ->  #${colors.base08-hex}  ->   rgb(${colors.base08-rgb-r}, ${colors.base08-rgb-g}, ${colors.base08-rgb-b})
    base09  ->  #${colors.base09-hex}  ->   rgb(${colors.base09-rgb-r}, ${colors.base09-rgb-g}, ${colors.base09-rgb-b})
    base0A  ->  #${colors.base0A-hex}  ->   rgb(${colors.base0A-rgb-r}, ${colors.base0A-rgb-g}, ${colors.base0A-rgb-b})
    base0B  ->  #${colors.base0B-hex}  ->   rgb(${colors.base0B-rgb-r}, ${colors.base0B-rgb-g}, ${colors.base0B-rgb-b})
    base0C  ->  #${colors.base0C-hex}  ->   rgb(${colors.base0C-rgb-r}, ${colors.base0C-rgb-g}, ${colors.base0C-rgb-b})
    base0D  ->  #${colors.base0D-hex}  ->   rgb(${colors.base0D-rgb-r}, ${colors.base0D-rgb-g}, ${colors.base0D-rgb-b})
    base0E  ->  #${colors.base0E-hex}  ->   rgb(${colors.base0E-rgb-r}, ${colors.base0E-rgb-g}, ${colors.base0E-rgb-b})
    base0F  ->  #${colors.base0F-hex}  ->   rgb(${colors.base0F-rgb-r}, ${colors.base0F-rgb-g}, ${colors.base0F-rgb-b})
  '';
}
