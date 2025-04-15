{ config, ... }:

{
  programs.fastfetch = with config.lib.stylix.colors; {
    enable = true;
    settings = {
      logo = {
        type = "small";
      };
      display = {
        separator = "";
      };
      modules = [
        "break"
        {
          key = "os     ";
          type = "os";
          keyColor = "38;2;${base0E-rgb-r};${base0E-rgb-g};${base0E-rgb-b}";
        }
        {
          key = "ker    ";
          type = "kernel";
          keyColor = "38;2;${base0B-rgb-r};${base0B-rgb-g};${base0B-rgb-b}";
        }
        {
          key = "wm     ";
          type = "wm";
          keyColor = "38;2;${base08-rgb-r};${base08-rgb-g};${base08-rgb-b}";
        }
        {
          key = "sh     ";
          type = "shell";
          keyColor = "38;2;${base07-rgb-r};${base07-rgb-g};${base07-rgb-b}";
        }
        {
          key = "cpu    ";
          type = "cpu";
          keyColor = "38;2;${base0A-rgb-r};${base0A-rgb-g};${base0A-rgb-b}";
        }
        {
          key = "gpu    ";
          type = "gpu";
          keyColor = "38;2;${base0E-rgb-r};${base0E-rgb-g};${base0E-rgb-b}";
        }
        {
          key = "ram    ";
          type = "memory";
          keyColor = "38;2;${base0B-rgb-r};${base0B-rgb-g};${base0B-rgb-b}";
        }
        {
          key = "col    ";
          type = "command";
          text = "~/.config/fastfetch/theme";
          keyColor = "38;2;${base08-rgb-r};${base08-rgb-g};${base08-rgb-b}";
        }
        {
          key = "bat    ";
          type = "battery";
          keyColor = "38;2;${base07-rgb-r};${base07-rgb-g};${base07-rgb-b}";
        }

        "break"
        {
          type = "colors";
          paddingLeft = 6;
          symbol = "circle";
        }
      ];

    };
  };
}
