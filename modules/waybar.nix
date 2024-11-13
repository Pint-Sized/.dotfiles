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

        "margin-left" = 6;
        "margin-right" = 6;
        "margin-top" = 2;
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
          "backlight"
          "temperature"
          "battery"
          "cpu"
          "memory"
          "custom/notification"
          "network"
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
          "format" = "{icon}{capacity}%";
          "on-click-right" = "kitty nvim ~/.dotfiles/system/power.nix";
          "format-charging" = "󰂄{capacity}%";
          "format-plugged" = "";
          "format-alt" = "{icon}{time}";
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

        "custom/music" = {
          "format" = "{icon}{}";
          "format-icons" = {
            "Playing" = "󰝚 ";
            "Paused" = "󰝛 ";
            "Stopped" = " ";
          };
          "escape" = true;
          "tooltip" = true;
          "exec" = "~/.config/waybar/scripts/caway -b 10 -f 60 -e";
          "return-type" = "json";
          "on-click" = "playerctl play-pause";
          "on-scroll-up" = "playerctl previous";
          "on-scroll-down" = "playerctl next";
          "on-click-right" = "g4music";
          "max-length" = 24;
        };

        "cava" = {
          "cava_config" = ".config/cava/config";
          "framerate" = 30;
          "autosens" = 1;
          "bars" = 10;
          "lower_cutoff_freq" = 50;
          "higher_cutoff_freq" = 10000;
          "method" = "pulse";
          "source" = "auto";
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
          "on-click-right" = "mode";
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
          "format-wifi" = "󰤥";
          "rotate" = 0;
          "format-ethernet" = "󰈀";
          "tooltip-format" = "Network: <big><b>{essid}</b></big>\nSignal strength: <b>{signaldBm}dBm ({signalStrength}%)</b>\nFrequency: <b>{frequency}MHz</b>\nInterface: <b>{ifname}</b>\nIP: <b>{ipaddr}/{cidr}</b>\nGateway: <b>{gwaddr}</b>\nNetmask: <b>{netmask}</b>";
          "format-linked" = "󰈀 {ifname} (No IP)";
          "format-disconnected" = "";
          "tooltip-format-disconnected" = "Disconnected";
          "on-click" = "kitty nvim ~/.dotfiles/system/wifi.nix";
          "interval" = 2;
        };
        "memory" = {
          "interval" = 3;
          "format" = " {percentage}%";
          "tooltip-format" = "{used:0.2f}GiB used out of {total:0.2f}GiB";
          "on-click" = "kitty btop";
        };
        "cpu" = {
          "interval" = 3;
          "format" = " {usage}%";
        };
        "temperature" = {
          "hwmon-path" = "/sys/class/hwmon/hwmon6/temp1_input";
          "format" = "{temperatureC}°C";
          "tooltip" = false;
          "interval" = 5;
        };
        "custom/launcher" = {
          "format" = "";
          "on-click" = "ulauncher-toggle";
          "tooltip" = false;
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
          @import "catppuccin.css";

          * {
            font-family: "0xProto Nerd Font";
<<<<<<< HEAD
            font-size: 17px;
=======
            font-size: 18px;
>>>>>>> 44f0f451fbe4f2b926f4bb7df893061ce1a8d01d
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

          




          #custom-launcher {
            color: @text;
            border-radius: 1rem 0px 0px 1rem;
            margin-left: 6px;

          }

          #custom-launcher:hover {
            color: @sky;
            border-radius: 1rem 0px 0px 1rem;
          }

          #tray,
          #backlight,
          #clock,
          #battery,
          #pulseaudio,
          #cpu,
          #custom-weather,
          #custom-music,
          #music,
          #cava,
          #memory,
          #temperature,
          #network,
          #custom-launcher,
          #memory {
            background-color: @surface0;
            padding: 0.5rem 0.75rem;
            margin: 5px 0;
          }

          #custom-launcher,
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
            color: @green;
          }

          #battery.critical:not(.charging) {
            color: @red;
          }

          #backlight {
            color: @peach;
          }

          #pulseaudio {
            color: @maroon;
            border-radius: 1rem 0px 0px 1rem;
            margin-left: 1rem;
          }
          
          #custom-notification {
      	border-radius: 1rem 0px 0px 1rem;
      	color: @flamingo;
          }
          
          #custom-lock {
              border-radius: 0rem 0px 0px 0rem;
              color: @lavender;
          }

          #custom-power {
              border-radius: 0px 1rem 1rem 0px;
              color: @red;
          }

          #network {
      	border-radius: 0rem 0px 0px 0rem;
      	color: @lavender;
          }

          #memory {
      	color: @pink;
      	border-radius: 0px 1rem 1rem 0px;
      	margin-right: 1rem
          }

          #temperature {
      	color: @yellow;
        }

          #cpu {
      	color: @lavender;
          }

          #custom-music.Playing {
              background: @surface0;
              color: @mauve;
              border-radius: 1rem 0px 0px 1rem;
              font-size: 17px;
          }
          
          #custom-music.Paused,
          #custom-music.Stopped {
              background: @surface0;
              color: @subtext0;
              border-radius: 1rem 0px 0px 1rem;
          }

          #cava {
            color: @text;
            border-radius: 0px 1rem 1rem 0px;
          }
    '';
  };

  home.file = {
    ".config/waybar/scripts" = {
      source = ../scripts;
    };
  };
}
