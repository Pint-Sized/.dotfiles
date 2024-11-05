{
  config,
  pkgs,
  catppuccin,
  lib,
  ...
}:

{
  # --------- WAYBAR ----------- #
  programs.waybar = {
    enable = true;
    settings = [
      {
        "layer" = "top";
        "position" = "top";
        # "width": 1280;

        "margin-left" = 0;
        "margin-right" = 0;
        "margin-top" = 0;
        "margin-bottom" = 0;
        "exclusive" = true;
        "passthrough" = false;
        "reload_style_on_change" = true;

        "modules-left" = [
          "custom/launcher"
          "hyprland/workspaces"
          "custom/music"
          # "cava"
        ];
        "modules-center" = [
          "clock"
          "custom/weather"
        ];
        "modules-right" = [
          "pulseaudio"
          "network"
          "cpu"
          # "memory"
          # "backlight"
          "temperature"
          "battery"
          "custom/notification"
          "custom/lock"
          "custom/power"
        ];
        "hyprland/workspaces" = {
          "disable-scroll" = true;
          "sort-by-name" = true;
          "format" = " {icon} ";
          "format-icons" = {
            "default" = "";
          };
        };
        "tray" = {
          "icon-size" = 21;
          "spacing" = 10;
        };
        "custom/music" = {
          "format" = "  {}";
          "escape" = true;
          "interval" = 1;
          "tooltip" = false;
          "exec" = "playerctl metadata --format='{{ title }}'";
          "on-click" = "playerctl play-pause";
          "on-scroll-up" = "playerctl previous";
          "on-scroll-down" = "playerctl next";
          "smooth-scrolling-threshold" = 1;
          "max-length" = 20;
        };
        "backlight" = {
          "device" = "intel_backlight";
          "format" = "{icon} {percent}%";
          "format-icons" = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
        };
        "battery" = {
          "states" = {
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{icon} {capacity}%";
          "format-charging" = "󰂄 {capacity}%";
          "format-plugged" = "";
          "format-alt" = "{icon} {time}";
          "format-icons" = [
            "󰂃"
            "󰂃"
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁿"
            "󰂀"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
        };
        "pulseaudio" = {
          # "scroll-step" = 1;
          "format" = "{icon} {volume}%";
          "format-muted" = "";
          "format-icons" = {
            "default" = [
              ""
              ""
              " "
            ];
          };
          "on-click" = "pavucontrol --tab=3";
        };
        "custom/notification" = {
          "tooltip" = false;
          "format" = "{icon}";
          "format-icons" = {
            "notification" = "󱅫";
            "none" = "󰂚";
            "dnd-notification" = "󱅫";
            "dnd-none" = "󱏧";
            "inhibited-notification" = "󱅫";
            "inhibited-none" = "󱅫";
            "dnd-inhibited-notification" = "󱅫";
            "dnd-inhibited-none" = "󱏧";
          };
          "return-type" = "json";
          "exec-if" = "which swaync-client";
          "exec" = "swaync-client -swb";
          "on-click-right" = "swaync-client -d -sw";
          "on-click" = "swaync-client -t -sw";
          "escape" = true;
        };
        "custom/lock" = {
          "tooltip" = false;
          "on-click" = "hyprlock";
          "format" = "";
        };
        "custom/power" = {
          "tooltip" = false;
          "on-click" = "wlogout &";
          "format" = "";
        };
        "network" = {
          "tooltip" = true;
          "format-icons" = [
            "󰤟"
            "󰤢"
            "󰤥"
          ];
          "format-wifi" = "󰖩 Wifi";
          "rotate" = 0;
          "format-ethernet" = "󰈀 Eth.";
          "tooltip-format" = "Network: <big><b>{essid}</b></big>\nSignal strength: <b>{signaldBm}dBm ({signalStrength}%)</b>\nFrequency: <b>{frequency}MHz</b>\nInterface: <b>{ifname}</b>\nIP: <b>{ipaddr}/{cidr}</b>\nGateway: <b>{gwaddr}</b>\nNetmask: <b>{netmask}</b>";
          "format-linked" = "󰈀 {ifname} (No IP)";
          "format-disconnected" = " ";
          "tooltip-format-disconnected" = "Disconnected";
          "on-click" = "/usr/local/bin/ags -t ControlPanel";
          "interval" = 2;
        };
        "memory" = {
          "interval" = 3;
          "format" = " {percentage}%";
          "tooltip-format" = "{used:0.2f}GiB used out of {total:0.2f}GiB";
        };
        "cpu" = {
          "interval" = 3;
          "format" = " {usage}%";
        };
        "temperature" = {
          "hwmon-path" = "/sys/class/hwmon/hwmon6/temp1_input";
          "format" = " {temperatureC}°C";
          "tooltip" = false;
          "interval" = 5;
        };
        "custom/launcher" = {
          "format" = "";
          "on-click" = "ulauncher-toggle";
          "tooltip" = false;
        };
        "cava" = {
          "framerate" = 60;
          "autosens" = 1;
          "bars" = 10;
          "lower_cutoff_freq" = 50;
          "higher_cutoff_freq" = 10000;
          "method" = "pipewire";
          "source" = "auto";
          "stereo" = true;
          "bar_delimiter" = 0;
          "noise_reduction" = 0.77;
          "input_delay" = 0;
          "hide_on_silence" = false;
          "format-icons" = [
            "▁"
            "▂"
            "▃"
            "▄"
            "▅"
            "▆"
            "▇"
            "█"
          ];
        };
        "clock" = {
          "timezone" = "Europe/Dublin";
          "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          "format" = "{:%a, %d %b, %I:%M %p}";
          "on-click" = "pkill waybar; waybar";
        };
        "custom/weather" = {
          "format" = "{}°";
          "tooltip" = true;
          "interval" = 3600;
          "exec" = "wttrbar --location New+Ross";
          "return-type" = "json";
        };
      }
    ];
    style = ''
          @import "mocha.css";

          * {
            font-family: "0xProto Nerd Font";
            font-size: 17px;
            min-height: 0;
            padding: 0;
            margin: 0;
          }

          #waybar {
            background: transparent;
            color: @text;
            margin: 5px 5px;
          }

          #workspaces {
            border-radius: 0px 1rem 1rem 0px;
            margin: 5px;
            background-color: @surface0;
            margin-left: 0rem;
            margin-right: 1rem;
          }

          #workspaces button {
            color: @lavender;
            border-radius: 1rem;
            padding: 0.4rem;
          }

          #workspaces button.active {
            color: @sky;
            border-radius: 1rem;
          }

          #workspaces button:hover {
            color: @sapphire;
            border-radius: 1rem;
          }

          #custom-music,
          #tray,
          #backlight,
          #clock,
          #battery,
          #pulseaudio,
          #custom-launcher,
          #cava,
          #cpu,
          #custom-weather,
          #memory,
          #temperature,
          #network,
          #memory {
            background-color: @surface0;
            padding: 0.5rem 0.75rem;
            margin: 5px 0;
          }

          #custom-notification,
          #custom-lock,
          #custom-power {
            background-color: @surface0;
            padding: 0.5rem 1rem;
            margin: 5px 0;
          }

          #clock {
            color: @lavender;
            border-radius: 1rem 0px 0px 1rem;
          }

          #custom-weather {
      	color: @flamingo;
      	border-radius: 0px 1rem 1rem 0px;
          }

          #battery {
            border-radius: 0px 1rem 1rem 0px;
            color: @green;
            margin-right: 1rem;
          }


          #battery.charging {
            color: @green;
            border-radius: 0px 1rem 1rem 0px;
            margin-right: 1rem;
          }

          #battery.warning:not(.charging) {
            color: @peach;
            border-radius: 0px 1rem 1rem 0px;
            margin-right: 1rem;
          }

          #battery.critical:not(.charging) {
            color: @red;
            border-radius: 0px 1rem 1rem 0px;
            margin-right: 1rem;
          }

          #backlight {
            color: @yellow;
          }

          #backlight, #battery {
              border-radius: 0;
          }

          #pulseaudio {
            color: @maroon;
            border-radius: 1rem 0px 0px 1rem;
            margin-left: 1rem;
          }

          #custom-music {
            color: @mauve;
            border-radius: 1rem 1rem 1rem 1rem;
            padding-left: 1rem;
            
          }

          #custom-notification {
      	border-radius: 1rem 0px 0px 1rem;
      	color: @flamingo;
      	font-size: 20px
          }
          #custom-lock {
              border-radius: 0rem 0px 0px 0rem;
              color: @lavender;
          }

          #custom-power {
              border-radius: 0px 1rem 1rem 0px;
              color: @red;
              margin-right: 6px;
          }

          #network {
      	border-radius: 0rem 0px 0px 0rem;
      	color: @peach;
          }

          #memory {
      	color: @green;
      	border-radius: 0px 0rem 0rem 0px;
          }

          #temperature {
      	color: @blue;
          }

          #cpu {
      	color: @yellow;
          }


          #custom-launcher {
      	color: @subtext1;
      	border-radius: 1rem 0px 0px 1rem;
        margin-left: 6px;
          }

          #cava {
      	color: @text;
      	border-radius: 0px 1rem 1rem 0px;
          }
    '';
  };

  home.file = {
  	".config/waybar/mocha.css" = {
  		text = ''
  		@define-color rosewater #f5e0dc;
  		@define-color flamingo #f2cdcd;
  		@define-color pink #f5c2e7;
  		@define-color mauve #cba6f7;
  		@define-color red #f38ba8;
  		@define-color maroon #eba0ac;
  		@define-color peach #fab387;
  		@define-color yellow #f9e2af;
  		@define-color green #a6e3a1;
  		@define-color teal #94e2d5;
  		@define-color sky #89dceb;
  		@define-color sapphire #74c7ec;
  		@define-color blue #89b4fa;
  		@define-color lavender #b4befe;
  		@define-color text #cdd6f4;
  		@define-color subtext1 #bac2de;
  		@define-color subtext0 #a6adc8;
  		@define-color overlay2 #9399b2;
  		@define-color overlay1 #7f849c;
  		@define-color overlay0 #6c7086;
  		@define-color surface2 #585b70;
  		@define-color surface1 #45475a;
  		@define-color surface0 #313244;
  		@define-color base #1e1e2e;
  		@define-color mantle #181825;
  		@define-color crust #11111b;
  		'';
  	};
  };
}
