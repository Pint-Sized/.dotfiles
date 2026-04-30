{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";
    "$terminal" = "kitty fish";
    "$filemanager" = "nautilus";
    "$browser" = "firefox";

    bind = [
      # --- Applications ---
      "$mainMod, Q, exec, $terminal"
      "$mainMod, W, exec, $browser"
      "$mainMod, Y, exec, $filemanager"
      "$mainMod, E, exec, kitty --detach fish -C y"
      "$mainMod, O, exec, remnote --enable-features=UseOzonePlatform --ozone-platform=wayland"
      "$mainMod, P, exec, waypaper"
      "$mainMod, N, exec, ulauncher-toggle"
      "$mainMod, semicolon, exec, emote"

      # --- Window Management ---
      "$mainMod, C, killactive"
      "$mainMod, V, togglefloating,"
      "$mainMod, J, layoutmsg, togglesplit"
      "$mainMod, X, fullscreen, 0"

      # Move Focus
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"

      # Swap Windows
      "$mainMod SHIFT, left, swapwindow, l"
      "$mainMod SHIFT, right, swapwindow, r"
      "$mainMod SHIFT, up, swapwindow, u"
      "$mainMod SHIFT, down, swapwindow, d"

      # --- Screenshots & Notifications ---
      "$mainMod SHIFT, P, exec, hyprshot -m region"
      "$mainMod, B, exec, swaync-client -t"
      "$mainMod SHIFT, B, exec, swaync-client -C"

      # --- Workspaces (1-6) ---
      # Workspace 1
      "$mainMod, 1, workspace, 1"
      "bind = $mainMod, 1 , exec, hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .specialWorkspace.name' | sed 's/special://' | xargs -I [] hyprctl dispatch togglespecialworkspace []"
      "$mainMod, 1, exec, pypr hide '*'"
      "$mainMod SHIFT, 1, movetoworkspace, 1"

      # Workspace 2
      "$mainMod, 2, workspace, 2"
      "bind = $mainMod, 2 , exec, hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .specialWorkspace.name' | sed 's/special://' | xargs -I [] hyprctl dispatch togglespecialworkspace []"
      "$mainMod, 2, exec, pypr hide '*'"
      "$mainMod SHIFT, 2, movetoworkspace, 2"

      # Workspace 3
      "$mainMod, 3, workspace, 3"
      "bind = $mainMod, 3 , exec, hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .specialWorkspace.name' | sed 's/special://' | xargs -I [] hyprctl dispatch togglespecialworkspace []"
      "$mainMod, 3, exec, pypr hide '*'"
      "$mainMod SHIFT, 3, movetoworkspace, 3"

      # Workspace 4
      "$mainMod, 4, workspace, 4"
      "bind = $mainMod, 4 , exec, hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .specialWorkspace.name' | sed 's/special://' | xargs -I [] hyprctl dispatch togglespecialworkspace []"
      "$mainMod, 4, exec, pypr hide '*'"
      "$mainMod SHIFT, 4, movetoworkspace, 4"

      # Workspace 5
      "$mainMod, 5, workspace, 5"
      "bind = $mainMod, 5 , exec, hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .specialWorkspace.name' | sed 's/special://' | xargs -I [] hyprctl dispatch togglespecialworkspace []"
      "$mainMod, 5, exec, pypr hide '*'"
      "$mainMod SHIFT, 5, movetoworkspace, 5"

      # Workspace 6
      "$mainMod, 6, workspace, 6"
      "bind = $mainMod, 6 , exec, hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .specialWorkspace.name' | sed 's/special://' | xargs -I [] hyprctl dispatch togglespecialworkspace []"
      "$mainMod, 6, exec, pypr hide '*'"
      "$mainMod SHIFT, 6, movetoworkspace, 6"

      # --- Pyprland Dropdowns & Special Workspaces ---
      "$mainMod, 7, exec, pypr toggle timetable"
      "$mainMod, 8, exec, pypr toggle pavucontrol"
      "$mainMod, 9, exec, pypr toggle discord"
      "$mainMod, 0, exec, pypr toggle whatsapp"
      "$mainMod, code:20, exec, pypr toggle email"
      "$mainMod, code:21, exec, pypr toggle spotify"
      "$mainMod, M, exec, pypr toggle calculator"
      "$mainMod, S, togglespecialworkspace, magic"
      "$mainMod SHIFT, S, movetoworkspace, special:magic"

      # --- System & Custom Scripts ---
      "$mainMod, L, exec, pkill wlogout || wlogout"
      "$mainMod, U, exec, ~/.local/scripts/hypr-powersaver-on.sh"
      "$mainMod, I, exec, ~/.local/scripts/hypr-powersaver-off.sh"
      "$mainMod, R, exec, ~/.local/scripts/reloader.sh"
      "$mainMod, K, exec, wl-copy < ~/.dotfiles/scripts/tester"

      # --- Hardware & Specialty Keys ---
      ",XF86Display, exec, kitty ~/.dotfiles/scripts/theme-switcher"
      ",XF86WLAN, exec, kitty ~/.dotfiles/scripts/wifi-rebuild"
      ",XF86Tools, exec, kitty nvim ~/.dotfiles"
      ",XF86Bluetooth, exec, blueman-manager"
      ",XF86Keyboard, exec, polychromatic-controller"
      ",XF86Favorites, exec, kitty ~/.dotfiles/scripts/package-rebuild"
      ",XF86AudioMicMute, exec, swayosd-client --input-volume mute-toggle"
      ", XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"
    ];

    binde = [
      # --- Resize Window ---
      "$mainMod ctrl, left, resizeactive, -10 0"
      "$mainMod ctrl, right, resizeactive, 10 0"
      "$mainMod ctrl, up, resizeactive, 0 -10"
      "$mainMod ctrl, down, resizeactive, 0 10"

      # --- Media & Brightness Controls ---
      ",XF86AudioLowerVolume, exec, swayosd-client --output-volume lower"
      ",XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise"
      ",XF86MonBrightnessDown, exec, swayosd-client --brightness lower"
      ",XF86MonBrightnessUp, exec, swayosd-client --brightness raise"
    ];

    bindm = [
      # --- Mouse Window Controls ---
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

    bindn = [
      # --- Pass-throughs & Modifiers ---
      ", v, pass, class:^(vesktop)$"
      ", Caps_Lock, exec, sleep 0.1; swayosd-client --caps-lock"
    ];
  };
}
