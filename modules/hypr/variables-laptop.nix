{
  # Mirror every external display onto the laptop panel as soon as it is connected
  wayland.windowManager.hyprland.settings.monitor = [
    "eDP-1, 1920x1080, 0x0, 1"
    ", preferred, auto, 1, mirror, eDP-1"
  ];
  wayland.windowManager.hyprland.settings.env = [
    "HYPRCURSOR_SIZE,14"
    "QT_QPA_PLATFORM,wayland;xcb"
    "GDK_BACKEND_PLATFORM,wayland;xcb"
    "XDG_CURRENT_DESKTOP,Hyprland"
    "XDG_SESSION_TYPE,wayland"
    "XDG_SESSION_DESKTOP,Hyprland"
    "GDK_SCALE,2"
    "ELECTRON_OZONE_PLATFORM_HINT,auto"
    "HYPRLAND_TRACE=1"
    "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
  ];
}
