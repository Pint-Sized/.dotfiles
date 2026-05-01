{
  config,
  userSettings,
  pkgs,
  ...
}:
let
  colors = config.lib.stylix.colors;
in
{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        "label" = "shutdown";
        "action" = "systemctl poweroff";
        "text" = "Shutdown";
        "keybind" = "s";
      }
      {
        "label" = "hibernate";
        "action" = "systemctl hibernate";
        "text" = "Hibernate";
        "keybind" = "h";
      }
      {
        "label" = "reboot";
        "action" = "systemctl reboot";
        "text" = "Reboot";
        "keybind" = "r";
      }
      {
        "label" = "lock";
        "action" = "~/.config/hypr/scripts/lock.sh";
        "text" = "Lock";
        "keybind" = "l";
      }
      {
        "label" = "suspend";
        "action" = "systemctl suspend";
        "text" = "Suspend";
        "keybind" = "s";
      }
      {
        "label" = "logout";
        "action" = "hyprctl dispatch exit 0";
        "text" = "Logout";
        "keybind" = "e";
      }
    ];
    style = ''
      window {
        font-family: "${userSettings.fontSerif}";
        font-size: 14pt;
        color: #${colors.base05-hex};
        background-color: rgba(${colors.base01-rgb-r}, ${colors.base01-rgb-g}, ${colors.base01-rgb-b}, 0.5);
      }
      button {
        background-repeat: no-repeat;
        background-position: center;
        background-size: 25%;
        border: none;
        background-color: rgba(${colors.base01-rgb-r}, ${colors.base01-rgb-g}, ${colors.base01-rgb-b}, 0);
        margin: 5px;
        transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
      }
      button:hover {
        background-color: rgba(${colors.base01-rgb-r}, ${colors.base01-rgb-g}, ${colors.base01-rgb-b}, 0.1);
      }
      button:focus {
        background-color: #${colors.base0E-hex};
        color: #${colors.base00-hex};
      }
      #lock {
        background-image: image(url("icons/lock.png"));
      }
      #lock:focus {
        background-image: image(url("icons/lock-hover.png"));
      }
      #logout {
        background-image: image(url("icons/logout.png"));
      }
      #logout:focus {
        background-image: image(url("icons/logout-hover.png"));
      }
      #suspend {
        background-image: image(url("icons/sleep.png"));
      }
      #suspend:focus {
        background-image: image(url("icons/sleep-hover.png"));
      }
      #shutdown {
        background-image: image(url("icons/power.png"));
      }
      #shutdown:focus {
        background-image: image(url("icons/power-hover.png"));
      }
      #reboot {
        background-image: image(url("icons/restart.png"));
      }
      #reboot:focus {
        background-image: image(url("icons/restart-hover.png"));
      }
      #hibernate {
        background-image: image(url("icons/sleep.png"));
      }
      #hibernate:focus {
        background-image: image(url("icons/sleep-hover.png"));
      }
    '';
  };
  home.file = {
    ".config/waybar/lock-hover.png".source = pkgs.fetchurl {
      url = "https://github.com/the-pint-sized-powerhouse/icons/blob/main/lock-hover.png";
      sha256 = "";
    };
    #    ".config/waybar/lock.png".source = pkgs.fetchurl {
    # url = "https://github.com/the-pint-sized-powerhouse/icons/blob/main/lock.png";
    # sha256 = "";
    # };
    #".config/waybar/logout-hover.png".source = pkgs.fetchurl {
    # url = "https://github.com/the-pint-sized-powerhouse/icons/blob/main/logout-hover.png";
    # sha256 = "";
    # };
    # ".config/waybar/logout.png".source = pkgs.fetchurl {
    # url = "https://github.com/the-pint-sized-powerhouse/icons/blob/main/logout.png";
    #sha256 = "";
    #};
    # ".config/waybar/power-hover.png".source = pkgs.fetchurl {
    #   url = "https://github.com/the-pint-sized-powerhouse/icons/blob/main/power-hover.png";
    #   sha256 = "";
    # };
    # ".config/waybar/power.png".source = pkgs.fetchurl {
    #  url = "https://github.com/the-pint-sized-powerhouse/icons/blob/main/power.png";
    #   sha256 = "";
    #  };
    #  ".config/waybar/restart-hover.png".source = pkgs.fetchurl {
    #  url = "https://github.com/the-pint-sized-powerhouse/icons/blob/main/restart-hover.png";
    #  sha256 = "";
    #   };
    # ".config/waybar/restart.png".source = pkgs.fetchurl {
    #  url = "https://github.com/the-pint-sized-powerhouse/icons/blob/main/restart.png";
    #  sha256 = "";
    # };
    #  ".config/waybar/sleep-hover.png".source = pkgs.fetchurl {
    #   url = "https://github.com/the-pint-sized-powerhouse/icons/blob/main/sleep-hover.png";
    #   sha256 = "";
    # };
    #".config/waybar/sleep.png".source = pkgs.fetchurl {
    #url = "https://github.com/the-pint-sized-powerhouse/icons/blob/main/sleep.png";
    #sha256 = "";
  };
}
