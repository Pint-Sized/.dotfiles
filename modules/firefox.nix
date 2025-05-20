{pkgs, ...}: {
  programs = {
    firefox = {
      enable = true;
      package = pkgs.librewolf;
      nativeMessagingHosts = [pkgs.firefoxpwa];
      profiles."default" = {
        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "browser.uidensity" = 0; # Set UI density to normal
          "svg.context-properties.content.enabled" = true; # Enable SVG context-propertes
          "browser.theme.dark-private-windows" = false; # Disable private window dark theme
        };
      };
    };
  };
  stylix.targets.firefox = {
    enable = true;
    profileNames = ["default"];
    firefoxGnomeTheme.enable = true;
  };
}
