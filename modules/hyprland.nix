{ pkgs, ... }:

{
  # --------- HYPRLAND -------- #
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
    plugins = with pkgs.hyprlandPlugins; [
      borders-plus-plus
      hyprwinwrap
      hyprfocus
      hyprsplit
    ];
    extraConfig = ''

      source=~/.config/hypr/theme.conf

      ################
      ### MONITORS ###
      ################

      monitor = DP-1, 1920x1080@240,0x0,1
      monitor = eDP-1, 1920x1080,0x0,1


      ###################
      ### MY PROGRAMS ###
      ###################

      $terminal = kitty                            
      $fileManager = nautilus
      $browser = librewolf


      #################
      ### AUTOSTART ###
      #################
                          
      exec-once = sleep 4
      exec-once = hyprctl setcursor 16 &
      exec-once = swww-daemon &
      exec-once = sleep 2
      exec-once = ulauncher --no-window-shadow &
      exec-once = waybar &
      exec-once = udiskie &
      exec-once = wl-paste --watch cliphist store &
      exec-once = pypr &
      exec-once = pushd ~/.chevron; python3 -m http.server 9999; popd; &
      exec-once = ~/.dotfiles/scripts/auto-pull &
      exec-once = systemctl --user start hyprpolkitagent &
      exec-once = pkexec swayosd-libinput-backend &
      exec-once = swayosd-server &

      ####################
      ### START-UP APPS###
      ####################

      exec-once=[workspace 12 silent] spotify --enable-features=UseOzonePlatform --ozone-platform=wayland
      exec-once=[workspace 11 silent] thunderbird
      exec-once=[workspace 10 silent] com.github.IsmaelMartinez.teams_for_linux
      exec-once=[workspace 9 silent] zapzap
      exec-once=[workspace 8 silent] flatpak 'run' '--command=/app/bin/chrome' 'com.google.Chrome' '--profile-directory=Default' '--app-id=abdndmcckigaeepaljhpcngbfdkbiggb'
      exec-once=[workspace 7 silent] imv ~/School/School-TimetableV2.png


      ##############
      ### CURSOR ###
      ##############

      cursor {
        no_hardware_cursors = true
        no_warps = true
        inactive_timeout = 10
      }


      #############################
      ### ENVIRONMENT VARIABLES ###
      #############################

      env = HYPRCURSOR_SIZE,24
      env = QT_QPA_PLATFORM,wayland;xcb
      env = XDG_CURRENT_DESKTOP,Hyprland
      env = XDG_SESSION_TYPE,wayland
      env = XDG_SESSION_DESKTOP,Hyprland
      env = QT_QPA_PLATFORM,wayland;xcb
      env = GDK_SCALE,2
      env = LIBVA_DRIVER_NAME,nvidia
      env = GBM_BACKEND,nvidia-drm
      env = __GLX_VENDOR_LIBRARY_NAME,nvidia
      env = NVD_BACKEND,direct


      ################
      ### XWAYLAND ###
      ################

      xwayland {
        force_zero_scaling = false
      }


      ###############
      ### PLUGINS ###
      ###############

      plugin {
        borders-plus-plus {
          add_borders = 1 # 0 - 9
          col.border_1 = $base00
          col.border_2 = $base0E
          border_size_1 = 10
          border_size_2 = -1
          natural_rounding = on
        }
        
        hyprwinwrap {
          class = kitty-bg
        }    
        
        hyprfocus {
          enabled = yes
          animate_floating = yes
          animate_workspacechange = yes
          focus_animation = shrink
          bezier = bezIn, 0.5,0.0,1.0,0.5
          bezier = bezOut, 0.0,0.5,0.5,1.0
          bezier = overshot, 0.05, 0.9, 0.1, 1.05
          bezier = smoothOut, 0.36, 0, 0.66, -0.56
          bezier = smoothIn, 0.25, 1, 0.5, 1
          bezier = realsmooth, 0.28,0.29,.69,1.08
          flash {
            flash_opacity = 0.95
            in_bezier = realsmooth
            in_speed = 0.5
            out_bezier = realsmooth
            out_speed = 3
          }
          shrink {
            shrink_percentage = 0.99
            in_bezier = realsmooth
            in_speed = 1
            out_bezier = realsmooth
            out_speed = 2
          }
        }
      }


      #####################
      ### LOOK AND FEEL ###
      #####################

      general {
        gaps_in = 2
        gaps_out = 0,6,6,6

        border_size = 3

        no_focus_fallback = true

        col.active_border = $base0E
        col.inactive_border = $base02

        resize_on_border = false

        allow_tearing = true

        layout = dwindle

        snap {
          enabled = true
        }
      }

      decoration {
        rounding = 4 

        active_opacity = 0.8
        inactive_opacity = 0.8
        fullscreen_opacity = 1

        blur {
          enabled = true
          size = 5
          passes = 2
          noise = 0
          new_optimizations = true
          ignore_opacity = true;
          contrast = 1.17
          popups = true;
          xray = true
        }

        shadow {
          enabled = false
        }
      }

      animations {
        enabled = true

        bezier = myBezier, 0.05, 0.9, 0.1, 1.05

        animation = windows, 1, 8, myBezier, slide
        animation = windowsOut, 1, 8, default, popin 80%
        animation = border, 1, 10, default
        animation = borderangle, 1, 8, default
        animation = fade, 1, 7, default
        animation = workspaces, 1, 6, default
      }

      dwindle {
        pseudotile = true
        preserve_split = true
        force_split = 2
        smart_resizing = false

      }

      master {
        new_status = master
      }

      misc {
        force_default_wallpaper = -1 
        disable_hyprland_logo = true 
        font_family = "0xProto Nerd Font"
        animate_manual_resizes = true
        close_special_on_empty = false
        new_window_takes_over_fullscreen = 2
        #initial_workspace_tracking = 2
        middle_click_paste = false
        vfr = true
      }


      #############
      ### INPUT ###
      #############

      input {
        kb_layout = gb
        kb_variant =
        kb_model =
        kb_options =
        kb_rules =

        follow_mouse = 2
        sensitivity = 0 # -1.0 - 1.0, 0 means no modification.

        touchpad {
          natural_scroll = false
        }
      }

      gestures {
        workspace_swipe = true
        workspace_swipe_invert = false
        workspace_swipe_forever = true
      }


      ####################
      ### KEYBINDINGSS ###
      ####################

      $mainMod = SUPER 

      bind = $mainMod, Q, exec, $terminal
      bind = $mainMod, C, killactive
      bind = $mainMod, E, exec, $fileManager
      bind = $mainMod, V, togglefloating,
      bind = $mainMod, J, togglesplit, # dwindle
      bind = $mainMod, W, exec, $browser
      bind = $mainMod, X, fullscreen, 0

      bind = $mainMod, left, movefocus, l
      bind = $mainMod, right, movefocus, r
      bind = $mainMod, up, movefocus, u
      bind = $mainMod, down, movefocus, d

      bind = $mainMod SHIFT, left, swapwindow, l
      bind = $mainMod SHIFT, right, swapwindow, r
      bind = $mainMod SHIFT, up, swapwindow, u
      bind = $mainMod SHIFT, down, swapwindow, d

      binde = $mainMod ctrl, left, resizeactive, -10 0
      binde = $mainMod ctrl, right, resizeactive, 10 0
      binde = $mainMod ctrl, up, resizeactive, 0 -10
      binde = $mainMod ctrl, down, resizeactive, 0 10

      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow

      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10
      bind = $mainMod, code:20, workspace, 11
      bind = $mainMod, code:21, workspace, 12

      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 10
      bind = $mainMod SHIFT, code:20, movetoworkspace, 11
      bind = $mainMod SHIFT, code:21, movetoworkspace, 12

      bind = $mainMod, S, togglespecialworkspace, magic
      bind = $mainMod SHIFT, S, movetoworkspace, special:magic

      bindr = $mainMod, N, exec, ulauncher-toggle
      bind = $mainMod, B, exec, swaync-client -t
      bindr = $mainMod, L, exec, pkill wlogout || wlogout
      bind = $mainMod, P, exec, waypaper
      bind = $mainMod, I, exec, code --enable-features=UseOzonePlatform --ozone-platform=wayland
      bindn = , v, pass, ^discord$
      bind = $mainMod, O, exec, remnote --enable-features=UseOzonePlatform --ozone-platform=wayland

      bind = $mainMod, T, exec, kitty ~/.dotfiles/scripts/theme-switcher

      bind =, XF86AudioMute, exec, swayosd-client --output-volume mute-toggle
      binde =, XF86AudioLowerVolume, exec, swayosd-client --output-volume lower
      binde =, XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise
      bind =, XF86AudioMicMute, exec, swayosd-client --input-volume mute-toggle
      binde =, XF86MonBrightnessDown, exec, swayosd-client --brightness lower
      binde =, XF86MonBrightnessUp, exec, swayosd-client --brightness raise
      bind =, XF86Display, exec, kitty ~/.dotfiles/scripts/theme-switcher
      bind =, XF86WLAN, exec, kitty ~/.dotfiles/scripts/wifi-rebuild
      bind =, XF86Tools, exec, kitty nvim ~/.dotfiles
      bind =, XF86Bluetooth, exec, blueman-manager
      bind =, XF86Keyboard, exec, polychromatic-controller
      bind =, XF86Favorites, exec, kitty ~/.dotfiles/scripts/package-rebuild
      bind = $mainMod, R, exec, ~/.dotfiles/scripts/reloader

      bindn =, Caps_Lock, exec, ~/.dotfiles/scripts/swayosd-caps

      ##############################
      ### WINDOWS AND WORKSPACES ###
      ##############################

      windowrulev2 = suppressevent maximize, class:.* 
    '';
  };
}
