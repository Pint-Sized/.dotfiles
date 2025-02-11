{
  home.file = {
    ".config/hypr/hyprlock.conf" = {
      text = ''
        source = $HOME/.config/hypr/theme.conf
        $font = 0xProto Nerd Font

        # BACKGROUND
        background {
            path = screenshot
            blur_size = 5
            blur_passes = 2
        }

        # GENERAL
        general {
            no_fade_in = false
            ignore_empty_input = true

        }

        # Day
        label {
            monitor =
            text = cmd[update:1000] echo -e "$(date +"%A")"
            color = $base07
            font_size = 90
            font_family = $font
            position = 0, 350
            halign = center
            valign = center
        }

        # Date-Month
        label {
            monitor =
            text = cmd[update:1000] echo -e "$(date +"%d %B")"
            color = $base07
            font_size = 40
            font_family = $font
            position = 0, 250
            halign = center
            valign = center
        }

        # Time
        label {
            monitor =
            text = cmd[update:1000] echo "<span>$(date +"- %I:%M -")</span>"
            color = $base07
            font_size = 20
            font_family = $font
            position = 0, 190
            halign = center
            valign = center
        }

        # Profie-Photo
        image {
            monitor =
            path = ~/.dotfiles/wallpapers/wynnie-profile-pic.jpeg
            border_size = 2
            border_color = $base02
            size = 130
            rounding = -1
            rotate = 0
            reload_time = -1
            reload_cmd = 
            position = 0, 40
            halign = center
            valign = center
        }

        # USER-BOX
        shape {
            monitor =
            size = 300, 60
            color = $base01
            rounding = -1
            border_size = 2
            border_color = $base02
            rotate = 0
            xray = false # if true, make a "hole" in the background (rectangle of specified size, no rotation)
            position = 0, -130
            halign = center
            valign = center
        }

        # USER
        label {
            monitor =
            text =  Fionn Bennett
            color = $base05
            outline_thickness = 2
            dots_size = 0.2 # Scale of input-field height, 0.2 - 0.8
            dots_spacing = 0.2 # Scale of dots' absolute size, 0.0 - 1.0
            dots_center = true
            font_size = 18
            font_family = $font
            position = 0, -130
            halign = center
            valign = center
        }

        # INPUT FIELD
        input-field {
            monitor =
            size = 300, 60
            outline_thickness = 2
            dots_size = 0.2 # Scale of input-field height, 0.2 - 0.8
            dots_spacing = 0.2 # Scale of dots' absolute size, 0.0 - 1.0
            dots_center = true
            outer_color = $base02
            inner_color = $base01
            font_color = $base05
            fade_on_empty = false
            font_family = $font
            placeholder_text = <i><span foreground="##ffffff">Enter Password</span></i>
            hide_input = false
            position = 0, -210
            halign = center
            valign = center
        }

        # Power
        label {
            monitor =
            text = 󰐥  󰜉  󰤄
            color = $base07
            font_size = 50
            position = 0, 100
            halign = center
            valign = bottom
        }
      '';
    };
  };
}
