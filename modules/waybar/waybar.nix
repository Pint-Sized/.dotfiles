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
        # "width": 1280,

        "margin-left" = 10;
        "margin-right" = 10;
        "margin-top" = 4;
        "margin-bottom" = 0;
        "exclusive" = true;
        "passthrough" = false;
        "reload_style_on_change" = true;

        "modules-left" = [
          "custom/launcher"
          "hyprland/workspaces"
          "custom/music"
          "cava"
        ];
        "modules-center" = [
          "clock"
          "custom/weather"
        ];
        "modules-right" = [
          "pulseaudio"
          "network"
          "cpu"
          "memory"
          "temperature"
          "backlight"
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
          "format" = "{icon}";
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
          "format" = "{icon}";
          "format-charging" = "";
          "format-plugged" = "";
          "format-alt" = "{icon}";
          "format-icons" = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
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
          "on-click" = "pavucontrol";
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
          "format-wifi" = [
            "<i class='fa-solid fa-wifi-slash'></i>"
            "{icon}"
          ];
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
          "hwmon-path" = "/sys/class/hwmon/hwmon3/temp1_input";
          "format" = " {temperatureC}°C";
          "tooltip" = false;
          "interval" = 5;
        };
        "custom/launcher" = {
          "format" = "";
          "on-click" = "rofi -show drun; pkill rofi";
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
            margin-left: 0rem
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
          #memory,
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
            color: @green;
          }


          #battery.charging {
            color: @green;
          }

          #battery.warning:not(.charging) {
            color: @red;
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
            border-radius: 1rem 0px 0px 1rem;
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
              margin-right: 1rem;
              border-radius: 0px 1rem 1rem 0px;
              color: @red;
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
      	border-radius: 0px 1rem 1rem 0px;
      	margin-right: 1rem;
          }

          #cpu {
      	color: @yellow;
          }


          #custom-launcher {
      	color: @subtext1;
      	border-radius: 1rem 0px 0px 1rem;
          }

          #cava {
      	color: @text;
      	border-radius: 0px 1rem 1rem 0px;
          }
    '';
  };

}
