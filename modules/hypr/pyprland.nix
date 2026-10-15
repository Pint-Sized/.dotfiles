{
  home.file = {
    ".config/pypr/config.toml".text = # toml
      ''
        [pyprland]
        plugins = [ "scratchpads" ]

        [scratchpads.music]
        animation = "fromTop"
        command = "com.mastermindzh.tidal-hifi"
        class = "com.mastermindzh.tidal-hifi"
        size = "90% 90%"
        lazy = true

        [scratchpads.whatsapp]
        animation = "fromTop"
        command = "zapzap"
        class = "com.rtosta.zapzap"
        size = "90% 90%"
        lazy = false

        [scratchpads.email]
        animation = "fromTop"
        command = "thunderbird"
        class = "thunderbird"
        size = "90% 90%"
        lazy = false


        [scratchpads.timetable]
        animation = "fromTop"
        command = "imv ~/School/school-timetable.png"
        class = "imv"
        size = "90% 90%"
        lazy = true

        [scratchpads.calculator]
        animation = "fromTop"
        command = "gnome-calculator"
        class = "org.gnome.Calculator"
        size = "90% 90%"
        lazy = true

        [scratchpads.pavucontrol]
        animation = "fromTop"
        command = "pavucontrol --tab 3"
        class = "org.pulseaudio.pavucontrol"
        size = "90% 90%"
        lazy = true
      '';
  };
}
