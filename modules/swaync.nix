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
    style = ''
      * {
          font-family: "${userSettings.fontSerif}";
          font-size: 10pt;
      }
      progress,
      progressbar,
      trough {
        border: 1px solid #${colors.base0E};
      }
      trough {
        background: #${colors.base01};
      }
      .notification.low,
      .notification.normal {
        border: 1px solid #${colors.base0E};
      }
      .notification.low progress,
      .notification.normal progress {
        background: #${colors.base0F};
      }
      .notification.critical {
        border: 1px solid #${colors.base08};
      }
      .notification.critical progress {
        background: #${colors.base08};
      }
      .summary {
        color: #${colors.base05};
      }
      .body {
        color: #${colors.base06};
      }
      .time {
        color: #${colors.base06};
      }
      .notification-action {
        color: #${colors.base05};
        background: #${colors.base01};
        border: 1px solid #${colors.base0E};
      }
      .notification-action:hover {
        background: #${colors.base01};
        color: #${colors.base05};
      }
      .notification-action:active {
        background: #${colors.base0F};
        color: #${colors.base05};
      }
      .close-button {
        color: #${colors.base02};
        background: #${colors.base08};
      }
      .close-button:hover {
        background: lighter(#${colors.base08});
        color: lighter(#${colors.base02});
      }
      .close-button:active {
        background: #${colors.base08};
        color: #${colors.base00};
      }
      .notification-content {
        background: #${colors.base00};
        border: 1px solid #${colors.base0E};
      }
      .floating-notifications.background .notification-row .notification-background {
        background: transparent;
        color: #${colors.base05};
      }
      .notification-group .notification-group-buttons,
      .notification-group .notification-group-headers {
        color: #${colors.base05};
      }
      .notification-group .notification-group-headers .notification-group-icon {
        color: #${colors.base05};
      }
      .notification-group .notification-group-headers .notification-group-header {
        color: #${colors.base05};
      }
      .notification-group.collapsed .notification-row .notification {
        background: #${colors.base01};
      }
      .notification-group.collapsed:hover
        .notification-row:not(:only-child)
        .notification {
        background: #${colors.base01};
      }
      .control-center {
        background: #${colors.base00};
        border: 1px solid #${colors.base0E};
        color: #${colors.base05};
      }
      .control-center .notification-row .notification-background {
        background: #${colors.base00};
        color: #${colors.base05};
      }
      .control-center .notification-row .notification-background:hover {
        background: #${colors.base00};
        color: #${colors.base05};
      }
      .control-center .notification-row .notification-background:active {
        background: #${colors.base0F};
        color: #${colors.base05};
      }
      .widget-title {
        color: #${colors.base05};
        margin: 0.5rem;
      }
      .widget-title > button {
        background: #${colors.base01};
        border: 1px solid #${colors.base0E};
        color: #${colors.base05};
      }
      .widget-title > button:hover {
        background: #${colors.base01};
      }
      .widget-dnd {
        color: #${colors.base05};
      }
      .widget-dnd > switch {
        background: #${colors.base01};
        border: 1px solid #${colors.base0E};
      }
      .widget-dnd > switch:hover {
        background: #${colors.base01};
      }
      .widget-dnd > switch:checked {
        background: #${colors.base0F};
      }
      .widget-dnd > switch slider {
        background: #${colors.base06};
      }
      .widget-mpris {
        color: #${colors.base05};
      }
      .widget-mpris .widget-mpris-player {
        background: #${colors.base01};
        border: 1px solid #${colors.base0E};
      }
      .widget-mpris .widget-mpris-player button:hover {
        background: #${colors.base01};
      }
      .widget-mpris .widget-mpris-player > box > button {
        border: 1px solid #${colors.base0E};
      }
      .widget-mpris .widget-mpris-player > box > button:hover {
        background: #${colors.base01};
        border: 1px solid #${colors.base0E};
      }
    '';
  };
}
