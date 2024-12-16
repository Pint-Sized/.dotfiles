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

}
