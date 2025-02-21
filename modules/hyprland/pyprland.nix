{
  home.file = {
    ".config/hypr/pyprland.toml" = {
      text = ''
        [pyprland]
        plugins = [ "scratchpads" ]

        [scratchpads.spotify]
        animation = "fromTop"
        command = "spotify --force-device-scale-factor=1.5 %U"
        class = "Spotify"
        size = "90% 90%"
        unfocus = "hide"
        hide_delay = 0.0
        lazy = false

        [scratchpads.terminal]
        animation = "fromTop"
        command = "kitty"
        class = "kitty"
        size = "90% 90%"
        unfocus = "hide"
        hide_delay = 0.0
        lazy = false

        [scratchpads.whatsapp]
        animation = "fromTop"
        command = "zapzap"
        class = "com.rtosta.zapzap"
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
