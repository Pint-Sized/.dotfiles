{pkgs, ...}: {
  programs = {
    librewolf = {
      enable = true;
      package = pkgs.librewolf;
      profiles."8b2kzims.default" = {
        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true; # Enable customChrome.cs
          "browser.uidensity" = 0; # Set UI density to normal
          "svg.context-properties.content.enabled" = true; # Enable SVG context-propertes
          "browser.theme.dark-private-windows" = false; # Disable private window dark theme
        };
      };
    };
    firefox = {
      enable = true;
      package = pkgs.librewolf;
      nativeMessagingHosts = [pkgs.firefoxpwa];
      profiles."8b2kzims.default" = {
        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "browser.uidensity" = 0; # Set UI density to normal
          "svg.context-properties.content.enabled" = true; # Enable SVG context-propertes
          "browser.theme.dark-private-windows" = false; # Disable private window dark theme
        };
      };
    };
  };
  stylix.targets.librewolf = {
    profileNames = ["8b2kzims.default"];
    firefoxGnomeTheme.enable = true;
  };
}
