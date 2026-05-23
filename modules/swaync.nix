{ config, userSettings, ... }:
let
  colors = config.lib.stylix.colors;
in
{
  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "top";
      layer = "top";
      control-center-layer = "top";
      layer-shell = true;
      cssPriority = "application";
      control-center-margin-top = 0;
      control-center-margin-bottom = 0;
      control-center-margin-right = 0;
      control-center-margin-left = 0;
      notification-2fa-action = true;
      notification-inline-replies = false;
      notification-icon-size = 64;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
    };
    style = # css
      ''
        * {
            font-family: "${userSettings.fontSerif}";
            font-size: 10pt;
        }
        progress,
        progressbar,
        trough {
          border: 1px solid #${colors.base0E}CC;
        }
        trough {
          background: #${colors.base01}CC;
        }
        .notification.low,
        .notification.normal {
          border: 1px solid #${colors.base0E}CC;
        }
        .notification.low progress,
        .notification.normal progress {
          background: #${colors.base0F}CC;
        }
        .notification.critical {
          border: 1px solid #${colors.base08}CC;
        }
        .notification.critical progress {
          background: #${colors.base08}CC;
        }
        .summary {
          color: #${colors.base05}CC;
        }
        .body {
          color: #${colors.base06}CC;
        }
        .time {
          color: #${colors.base06}CC;
        }
        .notification-action {
          color: #${colors.base05}CC;
          background: #${colors.base01}CC;
          border: 1px solid #${colors.base0E}CC;
        }
        .notification-action:hover {
          background: #${colors.base01}CC;
          color: #${colors.base05}CC;
        }
        .notification-action:active {
          background: #${colors.base0F}CC;
          color: #${colors.base05}CC;
        }
        .close-button {
          color: #${colors.base02}CC;
          background: #${colors.base08}CC;
        }
        .close-button:hover {
          background: lighter(#${colors.base08}CC);
          color: lighter(#${colors.base02}CC);
        }
        .close-button:active {
          background: #${colors.base08}CC;
          color: #${colors.base00}CC;
        }
        .notification-content {
          background: #${colors.base00}CC;
          border: 1px solid #${colors.base0E}CC;
        }
        .floating-notifications.background .notification-row .notification-background {
          background: transparent;
          color: #${colors.base05}CC;
        }
        .notification-group .notification-group-buttons,
        .notification-group .notification-group-headers {
          color: #${colors.base05}CC;
        }
        .notification-group .notification-group-headers .notification-group-icon {
          color: #${colors.base05}CC;
        }
        .notification-group .notification-group-headers .notification-group-header {
          color: #${colors.base05}CC;
        }
        .notification-group.collapsed .notification-row .notification {
          background: #${colors.base01}CC;
        }
        .notification-group.collapsed:hover
          .notification-row:not(:only-child)
          .notification {
          background: #${colors.base01}CC;
        }
        .control-center {
          background: #${colors.base00}CC;
          border: 1px solid #${colors.base0E}CC;
          color: #${colors.base05}CC;
        }
        .control-center .notification-row .notification-background {
          background: #${colors.base00}CC;
          color: #${colors.base05}CC;
        }
        .control-center .notification-row .notification-background:hover {
          background: #${colors.base00}CC;
          color: #${colors.base05}CC;
        }
        .control-center .notification-row .notification-background:active {
          background: #${colors.base0F}CC;
          color: #${colors.base05}CC;
        }
        .widget-title {
          color: #${colors.base05}CC;
          margin: 0.5rem;
        }
        .widget-title > button {
          background: #${colors.base01}CC;
          border: 1px solid #${colors.base0E}CC;
          color: #${colors.base05};
        }
        .widget-title > button:hover {
          background: #${colors.base01}CC;
        }
        .widget-dnd {
          color: #${colors.base05}CC;
        }
        .widget-dnd > switch {
          background: #${colors.base01}CC;
          border: 1px solid #${colors.base0E}CC;
        }
        .widget-dnd > switch:hover {
          background: #${colors.base01}CC;
        }
        .widget-dnd > switch:checked {
          background: #${colors.base0F}CC;
        }
        .widget-dnd > switch slider {
          background: #${colors.base06}CC;
        }
        .widget-mpris {
          color: #${colors.base05}CC;
        }
        .widget-mpris .widget-mpris-player {
          background: #${colors.base01}CC;
          border: 1px solid #${colors.base0E}CC;
        }
        .widget-mpris .widget-mpris-player button:hover {
          background: #${colors.base01}CC;
        }
        .widget-mpris .widget-mpris-player > box > button {
          border: 1px solid #${colors.base0E}CC;
        }
        .widget-mpris .widget-mpris-player > box > button:hover {
          background: #${colors.base01}CC;
          border: 1px solid #${colors.base0E}CC;
        }
      '';
  };
}
