{ pkgs, ... }:

{
  # --------- HYPRLAND -------- #
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
    plugins = [
      pkgs.hyprlandPlugins.borders-plus-plus
      pkgs.hyprlandPlugins.hyprwinwrap
      pkgs.hyprlandPlugins.hyprfocus
      pkgs.hyprlandPlugins.hyprsplit
      pkgs.hyprlandPlugins.hypr-dynamic-cursors
      #hypr-darkwindow.packages.${pkgs.system}.Hypr-DarkWindow
    ];

    settings = {
      source = "~/.config/hypr/theme.conf";

      ################
      ### MONITORS ###
      ################
      monitor = [
        "DP-1, 1920x1080@240, 0x0, 1"
        "eDP-1, 1920x1080, 0x0, 1"
      ];

      ###################
      ### MY PROGRAMS ###
      ###################
      "$terminal" = "kitty";
      "$filemanager" = "nautilus";
      "$browser" = "librewolf";

      #################
      ### AUTOSTART ###
      #################
      exec-once = [
        "sleep 4"
        "hyprctl setcursor 16"
        "swww-daemon &"
        "sleep 2"
        "ulauncher --no-window-shadow &"
        "waybar &"
        "udiskie &"
        "wl-paste --watch clihist store &"
        "pypr &"
        "~/.dotfiles/scripts/auto-pull"
        "systemctl --user start hyprpolkitagent &"
        "pkexec swayosd-libinput-backend &"
        "swayosd-server &"
      ];

      ##############
      ### CURSOR ###
      ##############
      cursor = {
        no_hardware_cursors = true;
        no_warps = true;
        inactive_timeout = 10;
      };

      #############################
      ### ENVIRONMENT VARIABLES ###
      #############################
      env = [
        "HYPRCURSOR_SIZE,14"
        "QT_QPA_PLATFORM,wayland;xcb"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "GDK_SCALE,2"
        "LIBVA_DRIVER_NAME,nvidia"
        "GBM_BACKEND,nvidia_drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "NVD_BACKEND,direct"
      ];

      ################
      ### XWAYLAND ###
      ################
      xwayland = {
        force_zero_scaling = false;
      };

      ###############
      ### PLUGINS ###
      ###############
      plugin = {
        borders-plus-plus = {
          add_borders = 1;
          "col.border_1" = "$base00";
          "col.border_2" = "$base0E";
          border_size_1 = 10;
          border_size_2 = -1;
          natural_rounding = "on";
        };
        hyprfocus = {
          enabled = "yes";
          animate_floating = "yes";
          animate_workspacechange = "yes";
          focus_animation = "shrink";
          bezier = [
            "bezIn, 0.5,0.0,1.0,0.5"
            "bezOut, 0.0,0.5,0.5,1.0"
            "overshot, 0.05, 0.9, 0.1, 1.05"
            "smoothOut, 0.36, 0, 0.66, -0.56"
            "smoothIn, 0.25, 1, 0.5, 1"
            "realsmooth, 0.28,0.29,.69,1.08"
          ];
          flash = {
            flash_opacity = 0.95;
            in_bezier = "realsmooth";
            in_speed = 0.5;
            out_bezier = "realsmooth";
            out_speed = 3;
          };
          shrink = {
            shrink_percentage = 0.99;
            in_bezier = "realsmooth";
            in_speed = 1;
            out_bezier = "realsmooth";
            out_speed = 2;
          };
        };
        hypr-dynamic-cursors = {
          enabled = true;
          mode = "tilt";
          threshold = 2;
          tilt = {
            limit = 5000;
            function = "negative_quadratic";
          };
        };
      };

      #####################
      ### LOOK AND FEEL ###
      #####################
      general = {
        gaps_in = 2;
        gaps_out = "0,6,6,6";
        border_size = 3;
        no_focus_fallback = true;
        "col.active_border" = "$base0E";
        "col.inactive_border" = "$base02";
        resize_on_border = false;
        allow_tearing = true;
        layout = "dwindle";
        snap = {
          enabled = true;
        };
      };

      decoration = {
        rounding = 4;
        active_opacity = 0.8;
        inactive_opacity = 0.8;
        fullscreen_opacity = 1;
        blur = {
          enabled = true;
          size = 5;
          passes = 2;
          noise = 0;
          new_optimizations = true;
          ignore_opacity = true;
          contrast = 1.17;
          popups = true;
          xray = true;
        };
        shadow = {
          enabled = false;
        };
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 8, myBezier, slide"
          "windowsOut, 1, 8, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
        force_split = 2;
        smart_resizing = false;
      };

      master = {
        new_status = "master";
      };

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = true;
        font_family = "0xProto Nerd Font";
        animate_manual_resizes = true;
        close_special_on_empty = false;
        new_window_takes_over_fullscreen = 2;
        middle_click_paste = false;
        vfr = true;
      };

      #############
      ### INPUT ###
      #############

      input = {
        kb_layout = "gb";
        follow_mouse = 2;
        sensitivity = 0;
        touchpad = {
          natural_scroll = false;
        };
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_invert = false;
        workspace_swipe_forever = true;
      };

      ###################
      ### KEYBINDINGS ###
      ###################
      "$mainMod" = "SUPER";

      bind = [
        "$mainMod, Q, exec, $terminal"
        "$mainMod, C, killactive"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating,"
        "$mainMod, J, togglesplit, # dwindle"
        "$mainMod, W, exec, $browser"
        "$mainMod, X, fullscreen, 0"

        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        "$mainMod SHIFT, left, swapwindow, l"
        "$mainMod SHIFT, right, swapwindow, r"
        "$mainMod SHIFT, up, swapwindow, u"
        "$mainMod SHIFT, down, swapwindow, d"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"

        "$mainMod, 7, exec, pypr toggle timetable"
        "$mainMod, 8, exec, pypr toggle foot"
        "$mainMod, 9, exec, pypr toggle discord"
        "$mainMod, 0, exec, pypr toggle whatsapp"
        "$mainMod, code:20, exec, pypr toggle email"
        "$mainMod, code:21, exec, pypr toggle spotify"
        "$mainMod, M, exec, pypr toggle calculator"

        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        "$mainMod, N, exec, ulauncher-toggle"
        "$mainMod, B, exec, swaync-client -t"
        "$mainMod, P, exec, waypaper"
        "$mainMod, I, exec, kitty -e y"
        "$mainMod, O, exec, remnote --enable-features=UseOzonePlatform --ozone-platform=wayland"

        "$mainMod, T, exec, kitty ~/.dotfiles/scripts/theme-switcher"
        "$mainMod, R, exec, ~/.dotfiles/scripts/reloader"

        ",XF86AudioMicMute, exec, swayosd-client --input-volume mute-toggle"
        ",XF86Display, exec, kitty ~/.dotfiles/scripts/theme-switcher"
        ",XF86WLAN, exec, kitty ~/.dotfiles/scripts/wifi-rebuild"
        ",XF86Tools, exec, kitty nvim ~/.dotfiles"
        ",XF86Bluetooth, exec, blueman-manager"
        ",XF86Keyboard, exec, polychromatic-controller"
        ",XF86Favorites, exec, kitty ~/.dotfiles/scripts/package-rebuild"

        ", XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"
      ];

      binde = [
        "$mainMod ctrl, left, resizeactive, -10 0"
        "$mainMod ctrl, right, resizeactive, 10 0"
        "$mainMod ctrl, up, resizeactive, 0 -10"
        "$mainMod ctrl, down, resizeactive, 0 10"
        ",XF86AudioLowerVolume, exec, swayosd-client --output-volume lower"
        ",XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise"
        ",XF86MonBrightnessDown, exec, swayosd-client --brightness lower"
        ",XF86MonBrightnessUp, exec, swayosd-client --brightness raise"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindn = [
        ", v, pass, ^discord$"
        ", Caps_Lock, exec, ~/.dotfiles/scripts/swayosd-caps"
      ];

      bindr = [
        "$mainMod, L, exec, pkill wlogout || wlogout"
        "$mainMod, U, exec, hyprctl keyword animations:enabled false; hyprctl keyword decoration:blur:enabled false; hyprctl keyword decoration:active_opacity 1; hyprctl keyword decoration:inactive_opacity 1; || hyprctl keyword animations:enabled true; hyprctl keyword decoration:blur:enabled true; hyprctl keyword decoration:active_opacity 0.8; hyprctl keyword decoration:inactive_opacity 0.8"
      ];

      ##############################
      ### WINDOWS AND WORKSPACES ###
      ##############################
      windowrulev2 = [
        "suppressevent maximize, class:.*"
        #"plugin:chromakey,fullscreen:0"
      ];
      #chromakey_background = "7,8,17";
    };
  };

  home.file = {
    ".config/hypr/pyprland.toml" = {
      text = ''
        [pyprland]
        plugins = [
          "scratchpads",
          "shortcuts_menu",
          "fetch_client_menu",
          "magnify",
          "monitors",
          "shift_monitors",
          "toggle_dpms",
        ]

        [scratchpads.spotify]
        animation = "fromTop"
        command = "spotify --force-device-scale-factor=1.5 %U"
        class = "Spotify"
        size = "90% 90%"
        unfocus = "hide"
        hide_delay = 0.0
        lazy = false

        [scratchpads.foot]
        animation = "fromTop"
        command = "kitty"
        class = "kitty"
        size = "90% 90%"
        unfocus = "hide"
        hide_delay = 0.0
        lazy = false

        [scratchpads.whatsapp]
        animation = "fromTop"
        command = "whatsie"
        class = "com.ktechpit.whatsie"
        size = "90% 90%"
        unfocus = "hide"
        hide_delay = 0.0
        lazy = false

        [scratchpads.discord]
        animation = "fromTop"
        command = "dissent"
        class = "so.libdb.dissent"
        size = "90% 90%"
        unfocus = "hide"
        hide_delay = 0.0
        lazy = false

        [scratchpads.email]
        animation = "fromTop"
        command = "thunderbird"
        class = "thunderbird"
        size = "90% 90%"
        unfocus = "hide"
        hide_delay = 0.0
        lazy = false


        [scratchpads.timetable]
        animation = "fromTop"
        command = "imv ~/School/School-TimetableV2.png"
        class = "imv"
        size = "90% 90%"
        unfocus = "hide"
        hide_delay = 0.0
        lazy = false

        [scratchpads.calculator]
        animation = "fromTop"
        command = "gnome-calculator"
        class = "org.gnome.Calculator"
        size = "90% 90%"
        unfocus = "hide"
        hide_delay = 0.0
        lazy = false
      '';
    };
  };
}
