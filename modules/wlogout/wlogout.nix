{
  # --------- WLOGOUT --------- #
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
  };
  home.file = {
    ".config/wlogout/icons.css" = {
      text = ''
        #lock {
          background-image: image(url("./icons/lock.png"));
        }
        #lock:focus {
          background-image: image(url("./icons/lock-hover.png"));
        }

        #logout {
          background-image: image(url("./icons/logout.png"));
        }
        #logout:focus {
          background-image: image(url("./icons/logout-hover.png"));
        }

        #suspend {
          background-image: image(url("./icons/sleep.png"));
        }
        #suspend:focus {
          background-image: image(url("./icons/sleep-hover.png"));
        }

        #shutdown {
          background-image: image(url("./icons/power.png"));
        }
        #shutdown:focus {
          background-image: image(url("./icons/power-hover.png"));
        }

        #reboot {
          background-image: image(url("./icons/restart.png"));
        }
        #reboot:focus {
          background-image: image(url("./icons/restart-hover.png"));
        }

        #hibernate {
          background-image: image(url("./icons/sleep.png"));
        }
        #hibernate:focus {
          background-image: image(url("./icons/sleep-hover.png"));
        }
      '';
    };
    ".config/wlogout/icons/".source = ./icons;
  };
}
