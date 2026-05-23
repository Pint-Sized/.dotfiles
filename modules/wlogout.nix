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
      }
      {
        "label" = "hibernate";
        "action" = "systemctl hibernate";
        "text" = "Hibernate";
      }
      {
        "label" = "reboot";
        "action" = "systemctl reboot";
        "text" = "Reboot";
      }
      {
        "label" = "lock";
        "action" = "~/.config/hypr/scripts/lock.sh";
        "text" = "Lock";
      }
      {
        "label" = "suspend";
        "action" = "systemctl suspend";
        "text" = "Suspend";
      }
      {
        "label" = "logout";
        "action" = "hyprctl dispatch exit 0";
        "text" = "Logout";
      }
    ];
    style = # css
      ''
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
    ".config/wlogout/icons/lock-hover.png".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/the-pint-sized-powerhouse/icons/main/lock-hover.png";
      sha256 = "sha256-/fWScnWNqfBuaq/QLfzhi7XJntCgRx/4m9dQuRPRCRA=";
    };
    ".config/wlogout/icons/lock.png".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/the-pint-sized-powerhouse/icons/main/lock.png";
      sha256 = "sha256-o+ZHIOIW3NeRH1QHfZDOW21uIoQ17gKkjqIfFfb0GcA=";
    };
    ".config/wlogout/icons/logout-hover.png".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/the-pint-sized-powerhouse/icons/main/logout-hover.png";
      sha256 = "sha256-LOrZf5Oi9KSWhZv3j5NQ/YR9cKGnkYc/zHE7XhmeQb4=";
    };
    ".config/wlogout/icons/logout.png".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/the-pint-sized-powerhouse/icons/main/logout.png";
      sha256 = "sha256-IP24S0M0+qOhyz9bv94hQhaxIKdhwP+6CtGcPCjUXIs=";
    };
    ".config/wlogout/icons/power-hover.png".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/the-pint-sized-powerhouse/icons/main/power-hover.png";
      sha256 = "sha256-DCUb8RthYMvWEKIKgSPPjlMOmZmHK7RpaA8/+sJqbRU=";
    };
    ".config/wlogout/icons/power.png".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/the-pint-sized-powerhouse/icons/main/power.png";
      sha256 = "sha256-9jaGWf8mdftyIfTUF9hXzeeLjWxbRnwOMJkuaGopKf0=";
    };
    ".config/wlogout/icons/restart-hover.png".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/the-pint-sized-powerhouse/icons/main/restart-hover.png";
      sha256 = "sha256-znRyhkbYpByNvyVKDYtNoVRLJ0ZehDQJL0aBf/reNCw=";
    };
    ".config/wlogout/icons/restart.png".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/the-pint-sized-powerhouse/icons/main/restart.png";
      sha256 = "sha256-PP6HCG1KJo9m7fdvUJNaXmyAAoZsozCuXE2Mlmr+dw0=";
    };
    ".config/wlogout/icons/sleep-hover.png".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/the-pint-sized-powerhouse/icons/main/sleep-hover.png";
      sha256 = "sha256-6khZRPsHzZ2VbDaXfO6RJJRAqtz23pNMHMAviUTkAlA=";
    };
    ".config/wlogout/icons/sleep.png".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/the-pint-sized-powerhouse/icons/main/sleep.png";
      sha256 = "sha256-o31k0DFXsmO4gqj9FhJSclITpFwmnQY6sS9ZhY8CguQ=";
    };
  };
}
