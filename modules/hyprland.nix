{
  config,
  pkgs,
  catppuccin,
  lib,
  ...
}:

{
  # --------- HYPRLAND -------- #
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
    plugins = [
      pkgs.hyprlandPlugins.borders-plus-plus
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
$browser = io.gitlab.librewolf-community

#################
### AUTOSTART ###
#################
                    
exec-once = sleep 4
exec-once = hyprctl setcursor 16	
exec-once = swww-daemon &
exec-once = sleep 1
exec-once = waybar &
exec-once = udiskie &
exec-once = lxqt-policykit-agent
exec-once = wl-paste --watch cliphist store
exec-once = ulauncher --no-window-shadow
exec-once = pypr
exec-once = pushd ~/.chevron; python3 -m http.server 9999; popd;
exec-once = ~/.dotfiles/scripts/auto-pull			                                  

####################
### START-UP APPS###
####################

exec-once=[workspace 12 silent] spotify --enable-features=UseOzonePlatform --ozone-platform=wayland
exec-once=[workspace 11 silent] thunderbird
exec-once=[workspace 10 silent]  flatpak 'run' '--command=/app/bin/chromium' 'org.chromium.Chromium' '--profile-directory=Default' '--app-id=hnpfjngllnobngcgfapefoaidbinmjnm'                      
exec-once=[workspace 9 silent]  flatpak 'run' '--command=/app/bin/chromium' 'org.chromium.Chromium' '--profile-directory=Default' '--app-id=cifhbcnohmdccbgoicgdjpfamggdegmo'
exec-once=[workspace 8 silent]  flatpak 'run' '--command=/app/bin/chromium' 'org.chromium.Chromium' '--profile-directory=Default' '--app-id=abdndmcckigaeepaljhpcngbfdkbiggb'
exec-once=[workspace 7 silent] imv ~/School/School-TimetableV2.png

##############
### CURSOR ###
##############

cursor {
  no_hardware_cursors = true
  no_warps = true
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

    border_size_1 = 8
    border_size_2 = -1

    natural_rounding = on
  }
}


#####################
### LOOK AND FEEL ###
#####################

general {
  gaps_in = 2
  gaps_out = 6

  border_size = 3


  resize_on_border = on
  extend_border_grab_area = 50
  hover_icon_on_border = on

  no_focus_fallback = true

  col.active_border = $base0E
  col.inactive_border = $base02

  resize_on_border = false

  allow_tearing = false

  layout = dwindle
}

decoration {
  rounding = 4 

  active_opacity = 0.8
  inactive_opacity = 0.8
  fullscreen_opacity = 1

  blur {
    enabled = true
    size = 3
    passes = 3
    noise = 0
    new_optimizations = true
    xray = true
    vibrancy = 0.1696
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
}

master {
  new_status = master
}

misc {
  force_default_wallpaper = -1 # Set to 0 or 1 to disable the anime mascot wallpapers
  disable_hyprland_logo = true # If true disables the random hyprland logo / anime girl background. :(
  font_family = "0xProto Nerd Font"
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
  workspace_swipe = false
}

####################
### KEYBINDINGSS ###
####################

$mainMod = SUPER # Sets "Windows" key as main modifier

bind = $mainMod, Q, exec, $terminal
bind = $mainMod, C, killactive
bind = $mainMod, E, exec, $fileManager
bind = $mainMod, V, togglefloating,
bind = $mainMod, R, exec, $menu
bind = $mainMod, J, togglesplit, # dwindle
bind = $mainMod, W, exec, $browser
bind = $mainMod, X, fullscreen, 0

# Move focus with mainMod + arrow keys
bind = $mainMod, left, movefocus, l
bind = $mainMod, right, movefocus, r
bind = $mainMod, up, movefocus, u
bind = $mainMod, down, movefocus, d

# Switch workspaces with mainMod + [0-9]
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

# Move active window to a workspace with mainMod + SHIFT + [0-9]
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

# Example special workspace (scratchpad)
bind = $mainMod, S, togglespecialworkspace, magic
bind = $mainMod SHIFT, S, movetoworkspace, special:magic

# Scroll through existing workspaces with mainMod + scroll
bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

# special
bindr = $mainMod, N, exec, ulauncher-toggle
bind = $mainMod, B, exec, swaync-client -t
# bind = $mainMod, O, exec, pkill waybar; waybar
bindr = $mainMod, L, exec, pkill wlogout || wlogout
bindr = $mainMod, P, exec, pkill waypaper || waypaper
bindr = $mainMod, I, exec, [float; move 72.5% 5%] pkill pavucontrol || pavucontrol
# bind = , v, pass, ^discord$
bind = $mainMod ctrl, right, resizeactive, 10 0
bind = $mainMod ctrl, left, resizeactive, -10 0
bind = $mainMod ctrl, up, resizeactive, 0 -10
bind = $mainMod ctrl, down, resizeactive, 0 10
bind = $mainMod SHIFT, right, swapwindow, r
bind = $mainMod SHIFT, left, swapwindow, l
bind = $mainMod SHIFT, up, swapwindow, u
bind = $mainMod SHIFT, down, swapwindow, d
bind = $mainMod, O, exec, remnote --enable-features=UseOzonePlatform --ozone-platform=wayland
bind = $mainMod, R, exec, emacs --enable-features=UseOzonePlatform --ozone-platform-wayland
##############################
### WINDOWS AND WORKSPACES ###
##############################
windowrule = float, ^(pavucontrol)$
windowrulev2 = suppressevent maximize, class:.* # You'll probably like this.

    '';
  };
}
